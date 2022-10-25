<template>
  <div>
    <v-layout row wrap>
      <v-flex md12 xs12 sm12>
        <v-card :loading="loading" flat>
          <v-form ref="form" lazy-validation>
            <v-card-text>
              <v-alert
                border="left"
                type="info"
                colored-border
                dismissible
                elevation="2"
                >L'adresse mail doit être unique</v-alert
              >

              <v-text-field
                label="Nom"
                prepend-inner-icon="person"
                :rules="[(v) => !!v || 'Ce champ est requis']"
                outlined
                v-model="svData.name"
              ></v-text-field>

              <v-text-field
                label="Email"
                prepend-inner-icon="email"
                :rules="[
                  (v) => !!v || 'Ce champ est requis',
                  (v) => /.+@.+\..+/.test(v) || 'L\'email doit être valide',
                ]"
                outlined
                v-model="svData.email"
              ></v-text-field>

              <v-text-field
                placeholder="+243..."
                label="N° de téléphone"
                prepend-inner-icon="phone_iphone"
                :rules="[(v) => !!v || 'Ce champ est requis']"
                outlined
                v-model="svData.telephone"
              ></v-text-field>

              <v-text-field
                label="Adresse domicile"
                prepend-inner-icon="location_on"
                :rules="[(v) => !!v || 'Ce champ est requis']"
                outlined
                v-model="svData.adresse"
              ></v-text-field>

              <v-select
                :items="[{ designation: 'M' }, { designation: 'F' }]"
                label="Sexe"
                prepend-inner-icon="extension"
                :rules="[(v) => !!v || 'Ce champ est requis']"
                outlined
                dense
                item-text="designation"
                item-value="designation"
                v-model="svData.sexe"
              ></v-select>

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





            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
             
              <v-btn color="primary" dark :loading="loading" @click="validate">
                {{ edit ? "Modifier" : "Ajouter" }}
              </v-btn>
            </v-card-actions>
          </v-form>
        </v-card>
      </v-flex>
    </v-layout>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
export default {
  data() {
    return {
      title: "Basic",
      loading: false,
      disabled: false,
      edit: false,
      svData: {
        id: "",
        name: "",
        email: "",
        password: "",
        // photo: "",
        sexe: "",
        telephone: "",
        adresse: "",

        idTer: "",
        idChef: "",
        idGroup: "",
        
      },
      stataData:{
        ChefferiList:'',
        groupementList:'',
      },
      fetchData: null,
      titreModal: "",
    };
  },
  computed: {
    ...mapGetters(["userList","ListeTerritoire","OurTerritoire", "isloading"]),
  },
 
  methods: {
    ...mapActions(["getUser","getOurTerritoire"]),

    editData(id) {
      this.editOrFetch(`${this.apiBaseURL}/showUser/${id}`).then(({ data }) => {
        var donnees = data.data;

          donnees.map((item) => {
           this.getChefferiTug(item.idTer);
            this.getGroupementTug(item.idChef);
          });

        this.getSvData(this.svData, data.data[0]);
        this.edit = true;
        this.dialog = true;
      });
    },

    validate() {
      this.svData.id = this.userData.id;
      if (this.$refs.form.validate()) {
        this.isLoading(true);

        this.insertOrUpdate(
          `${this.apiBaseURL}/insert_user`,
          JSON.stringify(this.svData)
        )
          .then(({ data }) => {
            this.showMsg(data.data);
            this.isLoading(false);
            this.edit = false;
            this.resetObj(this.svData);

            this.editData(this.userData.id);
          })
          .catch((err) => {
            this.svErr(), this.isLoading(false);
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
    this.editData(this.userData.id);
    this.getOurTerritoire();
  },
};
</script>