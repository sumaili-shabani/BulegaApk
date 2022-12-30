

<!-- debit -->

<!-- debit -->

<template>
  <div v-if="userData.id_role == null">
    <v-layout row wrap>
      <v-flex xs12 sm12 md8 lg8>
        <div class="mr-1">


          <v-container grid-list-xs>

            <div class="text-center">
              <div class="text-center">
                <h4>Création de compte</h4>
                <p>
                  S'identifier et devenir membre dès à présent
                  en complétent le formulaire de la fiche d'identification ci-bas!
                </p>
              </div>
            </div>

          <!-- stepper -->
          <v-stepper v-model="e1">
            <v-stepper-header>
              <v-stepper-step
                :complete="e1 > 1"
                step="1"
              >
                Informations Basique
              </v-stepper-step>

              <v-divider></v-divider>

              <v-stepper-step
                :complete="e1 > 2"
                step="2"
              >
                Autres Informations à Compléter
              </v-stepper-step>

              
            </v-stepper-header>
            <v-form ref="form" v-model="valid" lazy-validation autocomplete="off">
              <v-stepper-items>
                <v-stepper-content step="1">
                  <v-card
                    class="mb-12"
                    
                  >

                  <!-- Formulaire un -->
                  <v-layout row wrap>
                      <v-flex x12 md2></v-flex>
                      <v-flex x12 md8>
                        
                          
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
                          <br>
                        
                        
                      </v-flex>
                      <v-flex x12 md2></v-flex>
                  </v-layout>
                  <!-- fin -->



                
                
                  </v-card>

                  <v-btn
                    color="primary"
                    @click="e1 = 2"
                  >
                    Suivant
                  </v-btn>

                  <v-btn dark color="primary"  :disabledb="!valid" @click="validate">
                    <v-icon>save_alt</v-icon>
                    S'ENREGISTRER
                  </v-btn>

                  &nbsp; &nbsp; &nbsp; &nbsp;

                  J'ai déjà un compte?
                  <router-link to="/login_lega" style="text-decoration: none">Se connecter</router-link>
                </v-stepper-content>

                <v-stepper-content step="2">
                  <v-card
                    class="mb-12"
                    
                  >

                  <v-layout row wrap>
                    <v-flex xs11 sm12 md2 lg2>
                      
                    </v-flex>
                    <v-flex xs12 sm12 md8 lg8>

                      <v-select
                        :items="ListeCelibataire"
                        label="Quel est votre  Etat civil?"
                        prepend-inner-icon="extension"
                        
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
                        
                        prepend-inner-icon="extension"
                        outlined
                        v-model="svData.nomPere"
                      ></v-text-field>

                      <v-text-field
                        label="Quel est le nom de votre mère ? "
                        
                        prepend-inner-icon="extension"
                        outlined
                        v-model="svData.nomMere"
                      ></v-text-field>

                      <v-text-field
                        label="Dans quel pays vous habitez actuellement ?"
                        
                        prepend-inner-icon="extension"
                        outlined
                        v-model="svData.Pays"
                      ></v-text-field>

                      <v-text-field
                        label="Dans quelle province habitez- vous actuellement ?"
                        
                        prepend-inner-icon="extension"
                        outlined
                        v-model="svData.Province"
                      ></v-text-field>

                      <v-text-field
                        label="Quel est le nom de la ville ou village dans laquelle vous residez actuellement ? "
                        
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
                      
                    </v-flex>
                    <v-flex xs12 sm12 md2 lg2>
                      
                    </v-flex>
                  </v-layout>
                
                  </v-card>

                  <v-btn
                    color="primary"
                    @click="e1 = 1"
                  >
                    Retourner
                  </v-btn>

                  <v-btn dark color="primary"  :disabledb="!valid" @click="validate">
                    <v-icon>save_alt</v-icon>
                    S'ENREGISTRER
                  </v-btn>

                  &nbsp; &nbsp; &nbsp; &nbsp;

                  J'ai déjà un compte?
                  <router-link to="/login_lega" style="text-decoration: none">Se connecter</router-link>
                </v-stepper-content>

              
              </v-stepper-items>
            </v-form>
          </v-stepper>
          <!-- fin -->
          <dialogLoader v-if="diaL" />
            
          </v-container>

          


         

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
import suiteVue from './suite.vue';



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
      e1: 1,

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


        // autres
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
    ...mapGetters(["basicInfoList", "OurTerritoire", "sitInfoList", "ListeTerritoire", "categoryArticleList","ListeCelibataire", "ListeEtude","ListeActivite", "isloading"]),
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

