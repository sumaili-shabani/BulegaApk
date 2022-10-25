<template>
  <div>
    <v-layout row wrap>
      <v-flex md12 xs12 sm12>
        <v-card :loading="loading" flat>
          <v-form ref="form" lazy-validation>
            <v-card-text>
             
              <v-select
                :items="ListeCelibataire"
                label="Quel est votre  Etat civil?"
                prepend-inner-icon="extension"
                :rules="[(v) => !!v || 'Ce champ est requis']"
                outlined
                dense
                item-text="designation"
                item-value="designation"
                v-model="svData.etatcivil"
              ></v-select>

              <v-text-field
                label="Si vous êtes  marié, divorcé ou veuf(Ve) combien d’enfants avez-vous ?"
                prepend-inner-icon="extension"
                outlined
                v-model="svData.nbrEnfant"
              ></v-text-field>

              <v-text-field
                label="Quel est le nom de votre père ? "
                :rules="[(v) => !!v || 'Ce champ est requis']"
                prepend-inner-icon="extension"
                outlined
                v-model="svData.nomPere"
              ></v-text-field>

              <v-text-field
                label="Quel est le nom de votre mère ? "
                :rules="[(v) => !!v || 'Ce champ est requis']"
                prepend-inner-icon="extension"
                outlined
                v-model="svData.nomMere"
              ></v-text-field>

              <v-text-field
                label="Dans quel pays vous habitez actuellement ?"
                :rules="[(v) => !!v || 'Ce champ est requis']"
                prepend-inner-icon="extension"
                outlined
                v-model="svData.Pays"
              ></v-text-field>

              <v-text-field
                label="Dans quelle province habitez- vous actuellement ?"
                :rules="[(v) => !!v || 'Ce champ est requis']"
                prepend-inner-icon="extension"
                outlined
                v-model="svData.Province"
              ></v-text-field>

              <v-text-field
                label="Quel est le nom de la ville ou village dans laquelle vous residez actuellement ? "
                :rules="[(v) => !!v || 'Ce champ est requis']"
                prepend-inner-icon="extension"
                outlined
                v-model="svData.ville"
              ></v-text-field>

              <v-text-field
                label="Quel est le nom de la Commune dans laquelle vous habitez actuellement ?"
                prepend-inner-icon="extension"
                outlined
                v-model="svData.commune"
              ></v-text-field>

              <v-text-field
                label="Précisez  le nom du Quartier ou de la  rue dans laquelle  vous résidez actuellement"
                prepend-inner-icon="extension"
                outlined
                v-model="svData.quartier"
              ></v-text-field>

              <v-text-field
                label="Quel est le nom de votre Avenue de  votre résidence  actuelle "
                prepend-inner-icon="extension"
                outlined
                v-model="svData.avenue"
              ></v-text-field>

            
              <v-select
                :items="ListeEtude"
                label="Quel est  votre plus haut  Niveau d’Etudes  atteint ? "
                prepend-inner-icon="extension"
                :rules="[(v) => !!v || 'Ce champ est requis']"
                outlined
                dense
                item-text="designation"
                item-value="designation"
                v-model="svData.etude"
              ></v-select>

              <v-text-field
                label="Si vous avez fait les  études   secondaires ou universitaires,  dans quelle section ou faculté les avez-vous  réalisés ? "
                prepend-inner-icon="extension"
                outlined
                v-model="svData.faculte"
              ></v-text-field>

              <v-text-field
                label="Si vous avez fait les  études  de master ou de doctorant,  dans quelle domaine de recherche vous étiez vous spécialiser ?"
                prepend-inner-icon="extension"
                outlined
                v-model="svData.domaine"
              ></v-text-field>

              <v-select
                :items="ListeActivite"
                label="Quel type d’activité exercez- vous actuellement ?  "
                prepend-inner-icon="extension"
                :rules="[(v) => !!v || 'Ce champ est requis']"
                outlined
                dense
                item-text="designation"
                item-value="designation"
                v-model="svData.activite"
              ></v-select>

              <v-text-field
                label="Dans quelle entreprise exercez-vous actuellement ? "
                prepend-inner-icon="extension"
                outlined
                v-model="svData.entreprise"
              ></v-text-field>

              <v-text-field
                label="Quelle fonction assurez-vous au sein de votre entreprise ?"
                prepend-inner-icon="extension"
                outlined
                v-model="svData.fonction"
              ></v-text-field>


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
        fonction:"",	
        etatcivil: "",	
        nbrEnfant	: "",
        nomPere	: "",
        nomMere	: "",
        Pays	: "",
        Province: "",	
        ville	: "",
        commune	: "",
        quartier: "",	
        avenue: "",	
        etude	: "",
        faculte	: "",
        domaine	: "",
        activite: "",	
        entreprise: "",
      },
      fetchData: null,
      titreModal: "",
    };
  },
  computed: {
    ...mapGetters(["userList","ListeTerritoire","OurTerritoire",
    "ListeCelibataire", "ListeEtude","ListeActivite", "isloading"]),
  },
  created() {
    this.editData(this.userData.id);
  },
  methods: {
    ...mapActions(["getUser","getOurTerritoire"]),

    editData(id) {
      this.editOrFetch(`${this.apiBaseURL}/showUser/${id}`).then(({ data }) => {
        var donnees = data.data;

        //   donnees.map((item) => {
        //     this.svData.name = item.name;
        //     this.svData.email = item.email;
        //     this.svData.sexe = item.sexe;
        //     this.svData.id_role = item.name;
        //     this.svData.id = item.user_id;
        //     this.titleComponent = "modification de " + item.name;
        //   });

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
          `${this.apiBaseURL}/AutreInfoUpdated`,
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
  },
};
</script>