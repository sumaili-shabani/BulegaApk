
<!-- debit -->

<template>
  <div v-if="userData.id_role == null">
    <v-layout row wrap>
      <v-flex xs12 sm12 md8 lg8>
        <div class="mr-1">


          <!-- debit -->
          <div class="col-md-12">
           

            <v-container grid-list-xs>
              <v-layout row wrap>
                <v-flex xs12 sm12 md2 lg2>
                  
                </v-flex>
                <v-flex xs12 sm12 md8 lg8>
                  <v-card  flat>

                    <v-card-text>

                      <v-layout row wrap>
                        <v-flex x12 md2></v-flex>
                        <v-flex x12 md8>
                          <v-form ref="form" v-model="valid" lazy-validation autocomplete="off">
                            <div>
                              <h4>Authentification</h4>
                                <p>
                                  Accédez au portail en utilisant votre e-mail et votre code d'accès.
                                </p>
                            </div>
                            <br />
                            <v-text-field v-model="svData.email" outlined append-icon="email" :rules="[
                              (v) => !!v || 'Ce champ est requis',
                              (v) =>
                                /.+@.+\..+/.test(v) ||
                                'Doit être un email valide',
                            ]" placeholder="E-mail"></v-text-field>
                            <v-text-field placeholder="Password" v-model="svData.password"
                              :type="show1 ? 'text' : 'password'" outlined
                              :append-icon="show1 ? 'visibility' : 'visibility_off'"
                              :rules="[(v) => !!v || 'Ce champ est requis']" @click:append="show1 = !show1">
                            </v-text-field>

                            <v-checkbox label="Mot de passe oublié?" 
                              @blur="$v.checkbox.$touch()"></v-checkbox>

                            <v-btn dark color="primary" block :disabledb="!valid" @click="validate">
                              <v-icon>login</v-icon> Connexion
                            </v-btn>

                            <br />

                            Avez-vous un compte?
                            <router-link to="/register_lega" style="text-decoration: none">Créer un compte</router-link>

                            <br />
                            <br />
                          </v-form>
                        </v-flex>
                        <v-flex x12 md2></v-flex>
                      </v-layout>
                    </v-card-text>
                  </v-card>
                </v-flex>
                <v-flex xs12 sm12 md2 lg2>
                  
                </v-flex>

              </v-layout>
            </v-container>
            <dialogLoader v-if="diaL" />


          </div>

          <!-- fin -->

        </div>
      </v-flex>

      <v-flex xs12 sm12 md4 lg4>
        <div class="mr-1">
          <SideBar />
        </div>
      </v-flex>


    </v-layout>
  </div>
</template>
<script>
import { mapGetters, mapActions } from "vuex";
import dialogLoader from "./dialogLoader";
import SideBar from '../backend/siteInfo/SideBar.vue';

export default {
  components: {
    dialogLoader,
    SideBar,
  },
  data() {
    return {
      title: "about",
      query: "",
      dialog: false,
      loading: false,
      disabled: false,
      edit: false,

      svData: {
        email: "",
        password: "",
      },
      valid: false,
      diaL: false,
      show1: false,
      titre: "Connexion et authentification au système",
    }
  },
  computed: {
    ...mapGetters(["basicInfoList", "sitInfoList", "categoryArticleList", "isloading"]),
  },
  methods: {
    ...mapActions(["getInfoBasic", "getInfoSite", "getCategyArticle"]),

    showModal() {
      this.$refs.presentation.$data.dialog = true;
    },
    validate() {
      if (this.$refs.form.validate()) {
        this.diaL = true;
        this.insertOrUpdate(
          `${this.baseURL}/checkLogin`,
          JSON.stringify(this.svData)
        )
          .then(({ data }) => {
            if (data.wrong) {
              this.showError("Information incorrecte");
              this.diaL = false;
            }
            if (data.wrong == false) {

              this.diaL = false;

              window.location = `${this.baseURL}/dashbord`;
            }
          })
          .catch((error) => {
            error.response.status === 419
              ? window.location.reload()
              : this.svErr(),
              (this.diaL = false),
              (this.diaL = false);
          });
      }
    },

  },
  created() {

    this.getInfoSite();
    this.getInfoBasic();
    this.getCategyArticle();

  }
}
</script>



<!-- fin -->
