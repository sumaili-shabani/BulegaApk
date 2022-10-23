<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" persistent max-width="500">
      <v-card>
        <!-- form -->
        <v-form ref="form" lazy-validation>
          <v-card-title>
            {{ titleComponent }} <v-spacer></v-spacer>
            <v-btn depressed text small fab @click="dialog = false">
              <v-icon>close</v-icon>
            </v-btn>
          </v-card-title>
          <v-card-text>

            <v-card flat class="mx-auto" max-width="400">
              <div class="text-center">
                <v-avatar size="100">
                  <img
                    class="white--text align-end"
                    height="200px"
                    :src="
                      svData.avatar == null
                        ? `${baseURL}/images/avatar.png`
                        : `${baseURL}/images/` + svData.avatar
                    "
                  />
                </v-avatar>
              </div>
              <v-card-title>{{ svData.name }}</v-card-title>

              <v-card-subtitle class="pb-0"> {{ svData.email }} </v-card-subtitle>

              <v-card-text class="text--primary">
                <div>De son vrai nom {{ svData.name }}</div>
                <div>N° de téléphone {{ svData.telephone }}</div>
                <div>Adresse domicile {{ svData.adresse }}</div>

                <div>Sexe: {{ svData.sexe }}</div>

                <div>Territoire {{ svData.territoire }}</div>
                <div>Chefferie {{ svData.chefferie }}</div>
                <div>Groupement {{ svData.groupement }}</div>
              </v-card-text>
            </v-card>
          
          </v-card-text>

          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn depressed text @click="dialog = false">Fermer</v-btn>
            
          </v-card-actions>
        </v-form>
        <!-- in form -->
      </v-card>
    </v-dialog>
  </v-row>
</template>
<script>
import _ from "lodash";
import { mapGetters, mapActions } from "vuex";
export default {
  data() {
    return {
      dialog: false,
      loading: false,
      disabled: false,
      svData: {
        id: "",
        password: "",
        id_role: null,

        name: "",
        email: "",
        password: "",
        // photo: "",
        sexe: "",
        avatar: "",
        telephone: "",
        adresse: "",

        territoire: "",
        chefferie: "",
        groupement: "",

      },
      titleComponent: "",
      loading: false,
      edit: true,
    };
  },

  
  computed: {
    ...mapGetters(["roleList"]),
    
  },
  methods: {
    ...mapActions(["getRole"]),

    showInfoUser(id) {
      this.editOrFetch(`${this.apiBaseURL}/showUser/${id}`).then(({ data }) => {
        var donnees = data.data;

        this.getSvData(this.svData, data.data[0]);
        this.edit = true;
        this.dialog = true;
      });
    },

    



  },

  created() {
      this.getRole();
      
  },



};
</script>