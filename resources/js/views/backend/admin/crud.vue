<template>
  <v-layout>
    <v-flex md12>
      <v-dialog v-model="dialog" max-width="600px" persistent>
        <v-card :loading="loading">
          <v-form ref="form" lazy-validation>
            <v-card-title>
              {{ titleComponent }} <v-spacer></v-spacer>
              <v-tooltip bottom color="black">
                <template v-slot:activator="{ on, attrs }">
                  <span v-bind="attrs" v-on="on">
                    <v-btn @click="dialog = false" text fab depressed>
                      <v-icon>close</v-icon>
                    </v-btn>
                  </span>
                </template>
                <span>Fermer</span>
              </v-tooltip></v-card-title
            >
            <v-card-text>
              <v-layout row wrap>
                <v-flex xs12 sm12 lg12 md12>
                  <v-alert
                    border="left"
                    type="info"
                    colored-border
                    dismissible
                    elevation="2"
                    >L'adresse mail doit être unique</v-alert
                  >
                </v-flex>

                <v-flex xs12 md6 sm6 lg6>
                  <div class="mr-1">
                    <v-text-field
                      label="Nom"
                      prepend-inner-icon="person"
                      :rules="[(v) => !!v || 'Ce champ est requis']"
                      outlined
                      v-model="svData.name"
                    ></v-text-field>
                  </div>
                </v-flex>

                <v-flex xs12 md6 sm6 lg6>
                  <div class="mr-1">
                    <v-text-field
                      label="Email"
                      prepend-inner-icon="email"
                      :rules="[
                        (v) => !!v || 'Ce champ est requis',
                        (v) =>
                          /.+@.+\..+/.test(v) || 'L\'email doit être valide',
                      ]"
                      outlined
                      v-model="svData.email"
                    ></v-text-field>
                  </div>
                </v-flex>

                <v-flex xs12 md12 sm12 lg12>
                  <div class="mr-1">
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
                  </div>
                </v-flex>

                <v-flex xs12 md6 sm6 lg6>
                  <div class="mr-1">
                    <v-text-field
                      label="Téléphone"
                      prepend-inner-icon="phone_iphone"
                      :rules="[(v) => !!v || 'Ce champ est requis']"
                      outlined
                      v-model="svData.telephone"
                    ></v-text-field>
                  </div>
                </v-flex>

                <v-flex xs12 md6 sm6 lg6>
                  <div class="mr-1">
                    <v-text-field
                      label="Adresse domicile"
                      prepend-inner-icon="location_on"
                      :rules="[(v) => !!v || 'Ce champ est requis']"
                      outlined
                      v-model="svData.adresse"
                    ></v-text-field>
                  </div>
                </v-flex>

               

               

                <v-flex xs12 sm12 md12 lg12>
                  <div class="mr-1">
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
                  </div>
                </v-flex>

                <v-flex xs12 sm12 md6 lg6>
                  <div class="mr-1">

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


                  </div>
                </v-flex>

                <v-flex xs12 sm12 md6 lg6>
                  <div class="mr-1">
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
                  </div>
                </v-flex>

               

               

                
              </v-layout>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn depressed text @click="dialog = false"> Fermer </v-btn>
              <v-btn color="primary" dark :loading="loading" @click="validate">
                {{ edit ? "Modifier" : "Ajouter" }}
              </v-btn>
            </v-card-actions>
          </v-form>
        </v-card>
      </v-dialog>
      <br /><br />
      <v-layout>
        <v-layout>
          <v-flex md1></v-flex>
          <v-flex md10></v-flex>
          <v-flex md1></v-flex>
        </v-layout>

        <v-flex md12>
          <!-- bande -->
          <v-layout>
            <v-flex md1>
              <v-tooltip bottom>
                <template v-slot:activator="{ on, attrs }">
                  <span v-bind="attrs" v-on="on">
                    <v-btn :loading="loading" fab @click="onPageChange">
                      <v-icon>autorenew</v-icon>
                    </v-btn>
                  </span>
                </template>
                <span>Initialiser</span>
              </v-tooltip>
            </v-flex>
            <v-flex md6>
              <v-text-field
                append-icon="search"
                label="Recherche..."
                single-line
                solo
                outlined
                rounded
                hide-details
                v-model="query"
                @keyup="searchMember"
                clearable
              ></v-text-field>
            </v-flex>

            <v-flex md4></v-flex>

            <v-flex md1>
              <v-tooltip bottom color="black">
                <template v-slot:activator="{ on, attrs }">
                  <span v-bind="attrs" v-on="on">
                    <v-btn @click="showModal" fab color="primary">
                      <v-icon>add</v-icon>
                    </v-btn>
                  </span>
                </template>
                <span>Ajouter une retenu</span>
              </v-tooltip>
            </v-flex>
          </v-layout>
          <!-- bande -->

          <br />
          <v-card :loading="loading" :disabled="isloading">
            <v-card-text>
              <v-simple-table>
                <template v-slot:default>
                  <thead>
                    <tr>
                      <th class="text-left">Avatar</th>
                      <th class="text-left">Nom</th>
                      <th class="text-left">Email</th>
                      <th class="text-left">Sexe</th>
                      <th class="text-left">Etat</th>
                      <th class="text-left">Privilège</th>
                      <th class="text-left">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr v-for="item in fetchData" :key="item.user_id">
                      <td>
                        <!-- <v-avatar color="red">
                          <span class="white--text text-h5">
                            {{ item.name | subStr }}
                          </span>
                        </v-avatar> -->

                        <!-- image -->
                        <img
                          style="border-radius: 50px; width: 50px; height: 50px"
                          :src="
                            item.avatar == null
                              ? `${baseURL}/images/avatar.png`
                              : `${baseURL}/images/` + item.avatar
                          "
                        />
                        <!-- images -->
                      </td>
                      <td>{{ item.name }}</td>
                      <td>{{ item.email }}</td>
                      <td>{{ item.sexe }}</td>
                      <td>
                        <v-badge
                          bordered
                          color="primary"
                          icon="key"
                          overlap
                        >
                          <v-btn
                            elevation="2"
                            x-small
                            class="white--text"
                            :color="item.active == 1 ? 'success' : 'error'"
                            depressed
                            @click="operationEtat(item.user_id, item.active)"
                          >
                            {{ item.active == 1 ? "Actif " : "Inactif" }}
                          </v-btn>
                        </v-badge>
                      </td>
                      <td>
                        <v-badge bordered color="error" icon="person" overlap>
                          <v-btn
                            elevation="2"
                            x-small
                            class="white--text"
                            :color="item.id_role == 1 || item.id_role==3  ? 'success' : 'error'"
                            depressed
                          >
                            {{ item.role_name }}
                          </v-btn>
                        </v-badge>
                      </td>
                      <td>
                        <v-tooltip top color="black">
                          <template v-slot:activator="{ on, attrs }">
                            <span v-bind="attrs" v-on="on">
                              <v-btn @click="editData(item.user_id)" fab small
                                ><v-icon color="primary">edit</v-icon></v-btn
                              >
                            </span>
                          </template>
                          <span>Modifier</span>
                        </v-tooltip>

                        <v-tooltip top color="black">
                          <template v-slot:activator="{ on, attrs }">
                            <span v-bind="attrs" v-on="on">
                              <v-btn @click="clearP(item.user_id)" fab small
                                ><v-icon color="red">delete</v-icon></v-btn
                              >
                            </span>
                          </template>
                          <span>Supprimer</span>
                        </v-tooltip>

                        <v-tooltip top color="black">
                          <template v-slot:activator="{ on, attrs }">
                            <span v-bind="attrs" v-on="on">
                              <v-btn
                                @click="
                                  showRoleModal(
                                    item.user_id,
                                    item.name,
                                    item.id_role
                                  )
                                "
                                fab
                                small
                              >
                                <v-icon color="orange">lock</v-icon>
                              </v-btn>
                            </span>
                          </template>
                          <span>Modifier son privilège</span>
                        </v-tooltip>

                        <v-tooltip top color="black">
                          <template v-slot:activator="{ on, attrs }">
                            <span v-bind="attrs" v-on="on">
                              <v-btn
                                @click="
                                  showPhotoModal(item.user_id, item.avatar)
                                "
                                fab
                                small
                              >
                                <v-icon>perm_media</v-icon>
                              </v-btn>
                            </span>
                          </template>
                          <span>Modifier son avatar</span>
                        </v-tooltip>

                        

                        <!-- impression -->
                        <v-menu bottom rounded offset-y transition="scale-transition">
                          <template v-slot:activator="{ on }">
                            <v-btn icon v-on="on" small fab depressed text>
                              <v-icon>more_vert</v-icon>
                            </v-btn>
                          </template>

                          <v-list dense width="">
                           


                            <v-list-item link @click="printBillFiche(item.user_id)">
                              <v-list-item-icon>
                                <v-icon>print</v-icon>
                              </v-list-item-icon>
                              <v-list-item-title style="margin-left: -20px">PDF Fiche</v-list-item-title>
                            </v-list-item>

                            <v-divider></v-divider>
                            <v-subheader>Impression action</v-subheader>
                            <v-divider></v-divider>

                            <v-list-item link @click="printBill(item.user_id)">
                              <v-list-item-icon>
                                <v-icon>print_disabled</v-icon>
                              </v-list-item-icon>
                              <v-list-item-title style="margin-left: -20px">PDF Carte</v-list-item-title>
                            </v-list-item>
                            

                          </v-list>
                        </v-menu>
                        <!-- fin impression -->


                      </td>
                    </tr>
                  </tbody>
                </template>
              </v-simple-table>
              <hr />

              <v-pagination
                color="primary"
                v-model="pagination.current"
                :length="pagination.total"
                :total-visible="7"
                @input="onPageChange"
              ></v-pagination>
            </v-card-text>
          </v-card>
          <uploadImage ref="uploadImage" v-on:initialisateur="initialisateur" />
          <roleComponent ref="roleComponent" />
        </v-flex>
      </v-layout>
    </v-flex>
  </v-layout>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import uploadImage from "./photo";
import roleComponent from "./roleComponent.vue";
export default {
  components: {
    uploadImage,
    roleComponent,
  },
  data() {
    return {
      header: "Crud operation",
      titleComponent: "",
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
        telephone: "",
        adresse: "",
        // photo: "",
        sexe: "",

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
    ...mapGetters(["userList","OurTerritoire", "isloading"]),
  },
  methods: {
    ...mapActions(["getUser","getOurTerritoire"]),

    showPhotoModal(id, avatar) {
      this.$refs.uploadImage.$data.dialog = true;
      this.$refs.uploadImage.$data.svData.agentId = id;
      this.$refs.uploadImage.$data.image = avatar;
    },
    showRoleModal(id, name, id_role) {
      this.$refs.roleComponent.$data.dialog = true;
      this.$refs.roleComponent.$data.svData.id = id;
      this.$refs.roleComponent.$data.svData.id_role = id_role;

      this.$refs.roleComponent.$data.titleComponent =
        "modification de privilègle de: " + name;
    },
    showModal() {
      this.dialog = true;
      this.titleComponent = "Ajout utilisateur ";
      this.edit = false;
      this.resetObj(this.svData);
    },

    testTitle() {
      if (this.edit == true) {
        this.titleComponent = "modification de " + item.name;
      } else {
        this.titleComponent = "Ajout utilisateur ";
      }
    },

    searchMember: _.debounce(function () {
      this.onPageChange();
    }, 300),
    onPageChange() {
      this.fetch_data(`${this.apiBaseURL}/fetch_user?page=`);
    },

    initialisateur(){
      this.fetch_data(`${this.apiBaseURL}/fetch_user?page=`);
    },

    

    validate() {
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
              this.getUser();
              this.onPageChange();

              // this.dialog = false;
            })
            .catch((err) => {
              this.svErr(), this.isLoading(false);
            });
      }
    },
    editData(id) {
      this.editOrFetch(`${this.apiBaseURL}/fetch_single_user/${id}`).then(
        ({ data }) => {
          var donnees = data.data;

          donnees.map((item) => {
           
            this.svData.id = item.user_id;
            this.titleComponent = "modification de " + item.name;

            this.getChefferiTug(item.idTer);
            this.getGroupementTug(item.idChef);

          });

          this.getSvData(this.svData, data.data[0]);

         



          this.edit = true;
          this.dialog = true;
        }
      );
    },

    clearP(id) {
      this.confirmMsg().then(({ res }) => {
        this.delGlobal(`${this.apiBaseURL}/delete_user/${id}`).then(
          ({ data }) => {
            this.successMsg(data.data);
            this.onPageChange();
          }
        );
      });
    },

    operationEtat(id, etat) {
      if (id != "" && etat != "") {
        // alert("id:"+id+" etat:"+etat);

        this.confirmEtat().then(({ res }) => {
          this.delGlobal(
            `${this.apiBaseURL}/checkEtat_compte/${id}/${etat}`
          ).then(({ data }) => {
            this.successMsg(data.data);
            this.onPageChange();
          });
        });
      } else {
        this.confirmEtat().then(({ res }) => {
          this.delGlobal(
            `${this.apiBaseURL}/checkEtat_compte/${id}/${etat}`
          ).then(({ data }) => {
            this.successMsg(data.data);
            this.onPageChange();
          });
        });
      }
    },

   

    editTitleModal(id) {
      this.editOrFetch(`${this.apiBaseURL}/fetch_single_user/${id}`).then(
        ({ data }) => {
          var donnees = data.data;
          donnees.map((item) => {
            this.titleComponent = "modification de " + item.name;
          });
        }
      );
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

    printBill(id) {
      window.open(`${this.apiBaseURL}/pdf_card_identification?id=` + id);
    },
    printBillFiche(id) {
      window.open(`${this.apiBaseURL}/pdf_fiche_identification?id=` + id);
    },





  },
  created() {
    this.getUser();
    this.testTitle();
    this.onPageChange();
    this.getOurTerritoire();
  },
};
</script>