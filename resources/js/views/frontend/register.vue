

<!-- debit -->

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

                  <v-container grid-list-xs>
                    <v-card flat>

                      <v-card-text>
                        <v-layout row wrap>
                          <v-flex x12 md2></v-flex>
                          <v-flex x12 md8>
                            <v-form ref="form" v-model="valid" lazy-validation autocomplete="off">
                              <div>
                                <h4>Création de compte</h4>
                                <p>
                                  S'identifier et devenir membre dès à présent
                                  en complétent le formulaire de la fiche d'identification ci-bas!
                                </p>
                              </div>
                              <br />
                              <v-text-field label="Votre nom complet" append-icon="person"
                                :rules="[(v) => !!v || 'Ce champ est requis']" outlined v-model="svData.name">
                              </v-text-field>

                              <v-text-field v-model="svData.email" outlined append-icon="email" :rules="[
                                (v) => !!v || 'Ce champ est requis',
                                (v) =>
                                  /.+@.+\..+/.test(v) ||
                                  'Doit être un email valide',
                              ]" placeholder="E-mail"></v-text-field>

                              <v-select :items="[{ designation: 'M' }, { designation: 'F' }]" label="Sexe"
                                append-icon="wc" :rules="[(v) => !!v || 'Ce champ est requis']" outlined dense
                                item-text="designation" item-value="designation" v-model="svData.sexe"></v-select>

                              <v-text-field placeholder="Votre Mot de passe secret" label="Mot de passe"
                                v-model="svData.password" :type="show1 ? 'text' : 'password'" outlined
                                :append-icon="show1 ? 'visibility' : 'visibility_off'"
                                :rules="[(v) => !!v || 'Ce champ est requis']" @click:append="show1 = !show1">
                              </v-text-field>

                              <v-text-field label="N° de téléphone" prepend-inner-icon="phone_iphone" placeholder="+243..."
                                :rules="[(v) => !!v || 'Ce champ est requis']" outlined v-model="svData.telephone">
                              </v-text-field>

                              <v-text-field label="Adresse domicile" prepend-inner-icon="location_on"
                                :rules="[(v) => !!v || 'Ce champ est requis']" outlined v-model="svData.adresse">
                              </v-text-field>



                              <!-- territoire -->
                              <v-select
                                label="Nom du territoire"
                                prepend-inner-icon="house"
                                :rules="[(v) => !!v || 'Ce champ est requis']"
                                :items="OurTerritoire"
                                item-text="nomTerritoire"
                                item-value="id"
                                outlined
                                v-model="svData.idTer"
                                @change="getChefferiTug(svData.idTer)"
                              >
                              </v-select>

                              <v-select
                                label="Nom de la chefferie"
                                prepend-inner-icon="apartment"
                                :rules="[(v) => !!v || 'Ce champ est requis']"
                                :items="stataData.ChefferiList"
                                item-text="nomTer"
                                item-value="id"
                                outlined
                                v-model="svData.idChef"

                                @change="getGroupementTug(svData.idChef)"
                              >
                              </v-select>

                              <v-select
                                label="Nom du groupement"
                                prepend-inner-icon="home"
                                :rules="[(v) => !!v || 'Ce champ est requis']"
                                :items="stataData.groupementList"
                                item-text="nomGroup"
                                item-value="id"
                                outlined
                                v-model="svData.idGroup"
                              >
                              </v-select>
                              <!-- chefferie et groupement -->


                              <v-checkbox :rules="[
                                (v) => !!v || 'Vous devez accepter de continuer!',
                              ]" label="J'accepte Politique de confidentialité" required></v-checkbox>

                              <v-btn dark color="primary" block :disabledb="!valid" @click="validate">
                                <v-icon>save_alt</v-icon>
                                S'ENREGISTRER
                              </v-btn>

                              <br />

                              J'ai déjà un compte?
                              <router-link to="/login_lega" style="text-decoration: none">Se connecter</router-link>


                              <br />
                              <br />
                            </v-form>
                          </v-flex>
                          <v-flex x12 md2></v-flex>
                        </v-layout>
                      </v-card-text>
                    </v-card>
                  </v-container>



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
        id: "",
        name: "",
        email: "",
        password: "",
        sexe: "",
        idTer: "",
        idChef: "",
        idGroup: "",
        telephone:"",
        adresse:"",
      },
      stataData:{
        ChefferiList:'',
        groupementList:'',
      },
      valid: false,
      diaL: false,
      show1: false,
      titre:
        "Devenir à présent membre au système en créant un compte utilisateur",
    }
  },
  computed: {
    ...mapGetters(["basicInfoList", "OurTerritoire", "sitInfoList", "ListeTerritoire", "categoryArticleList", "isloading"]),
  },
  methods: {
    ...mapActions(["getInfoBasic", "getInfoSite","getOurTerritoire", "getCategyArticle"]),

    showModal() {
      this.$refs.presentation.$data.dialog = true;
    },
    validate() {
      if (this.$refs.form.validate()) {
        this.diaL = true;
        this.insertOrUpdate(
          `${this.baseURL}/register_count`,
          JSON.stringify(this.svData)
        )
          .then(({ data }) => {
            // console.log(data.data);

            this.showMsg(data.data);
            this.isLoading(false);
            // this.resetObj(this.svData);

            if (data.success == false) {
              this.showError("Information incorrecte");
              this.diaL = false;
            }
            if (data.success == true) {
              window.location = `${this.baseURL}/login_lega`;
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


    //fultrage de donnees
    async getChefferiTug(idTer) {
      this.isLoading(true);
      await axios
          .get(`${this.apiBaseURL}/fetch_chefferie_tug/${idTer}`)
          .then((res) => {
              var chart = res.data.data;

              if (chart) {
                  this.stataData.ChefferiList = chart;
              } else {
                  this.stataData.ChefferiList = [];
              }

              this.isLoading(false);

              //   console.log(this.stataData.car_optionList);
          })
          .catch((err) => {
              this.errMsg();
              this.makeFalse();
              reject(err);
          });
    },

    async getGroupementTug(idChef) {
      this.isLoading(true);
      await axios
          .get(`${this.apiBaseURL}/fetch_groupement_tug/${idChef}`)
          .then((res) => {
              var chart = res.data.data;

              if (chart) {
                  this.stataData.groupementList = chart;
              } else {
                  this.stataData.groupementList = [];
              }

              this.isLoading(false);

              //   console.log(this.stataData.car_optionList);
          })
          .catch((err) => {
              this.errMsg();
              this.makeFalse();
              reject(err);
          });
    },


  },
  created() {

    this.getInfoSite();
    this.getInfoBasic();
    this.getCategyArticle();
    this.getOurTerritoire();

  }
}
</script>



<!-- fin -->

