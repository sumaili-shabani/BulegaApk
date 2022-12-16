<template>
  <v-container>
    <v-footer padless>
      <v-card flat class="text-justify">
        <v-card-text class="text-center">
          <v-btn @click="redirect(sitInfoList.facebook)"  class="mx-4" icon>
            <v-icon size="24px">fa-facebook</v-icon>
          </v-btn>
          <v-btn @click="redirect(sitInfoList.twitter)" class="mx-4" icon>
            <v-icon size="24px">fa-twitter</v-icon>
          </v-btn>
          <v-btn  class="mx-4" icon>
            <v-icon @click="redirect(sitInfoList.linkedin)" size="24px">fa-linkedin</v-icon>
          </v-btn>
          <v-btn  class="mx-4" icon>
            <v-icon @click="redirect(sitInfoList.email)" size="24px">fa-google-plus</v-icon>
          </v-btn>
          <v-btn  class="mx-4" icon>
            <v-icon @click="redirect(sitInfoList.youtube)" size="24px">fa-youtube</v-icon>
          </v-btn>

          

        </v-card-text>
        <v-card-text
          class="pt-0"
        >
      <v-container grid-list-xs>
        <v-layout row wrap>
          <v-flex xs12 sm12 md6 lg6>
            <div class="mr-2">
              <h4>Objectif</h4>
              {{sitInfoList !== null?  sitInfoList.objectif  : ""}}
            </div>
          </v-flex>

          <v-flex xs12 sm12 md6 lg6>
            <div class="mr-2">
              <h4>Mission</h4>
              {{sitInfoList !== null? sitInfoList.mission  : ""}}
            </div>
          </v-flex>
        </v-layout>
      </v-container>

        
        </v-card-text>
        <v-card-text>
          <v-container grid-list-xs>
            <v-divider></v-divider>
                <v-layout row wrap>
                    <v-flex xs12 sm12 md4 lg4>

                      <v-container grid-list-xs>
                            <v-list>
                              <v-list-item-title><h4>Détail information </h4></v-list-item-title>
                            </v-list>
                        </v-container>
                        <div class="mr-1">

                            <v-container grid-list-xs>

                              <v-layout row wrap>
                                <v-flex xs12 sm12 md6 lg6>
                                  <div class="mr-1">

                                    <v-avatar
                                      tile
                                      size="150"
                                      color="red"
                                    >
                                      <img 
                                        
                                        :src="
                                          sitInfoList.logo == null
                                            ? `${baseURL}/images/avatar.png`
                                            : `${baseURL}/images/` + sitInfoList.logo
                                        "
                                      >
                                    </v-avatar>

                                  </div>
                                </v-flex>

                                <v-flex xs12 sm12 md6 lg6>
                                  <div class="mr-1">

                                     {{sitInfoList.description}}

                                  </div>
                                </v-flex>
                              </v-layout>
                              

                           

                            

                            
                            </v-container>
                            
                        </div>

                    </v-flex>

                    <v-flex xs12 sm12 md4 lg4>

                      <v-layout row wrap>
                        <v-container grid-list-xs>
                            <v-list>
                              <v-list-item-title><h4>Ressources et nos pages</h4></v-list-item-title>
                            </v-list>
                        </v-container>
                        <v-flex xs12 sm12 md6 lg6>
                          <div class="mr-1">

                            
                            <v-list>
                                <v-list-item router to="/" link>
                                    <v-list-item-content>
                                        Accueil
                                    </v-list-item-content>
                                </v-list-item>
                                <v-list-item router to="/galery_photo" link>
                                    <v-list-item-content>
                                        Galerie
                                    </v-list-item-content>
                                </v-list-item>

                                <v-list-item router to="/video" link>
                                    <v-list-item-content>
                                        Vidéo
                                    </v-list-item-content>
                                </v-list-item>
                                <v-list-item router to="/contact" link>
                                    <v-list-item-content>
                                        Contact
                                    </v-list-item-content>
                                </v-list-item>
                            </v-list>
                          </div>

                        </v-flex>

                        <v-flex xs12 sm12 md6 lg6>
                          <div class="mr-1">

                            <v-list>
                                <v-list-item router to="/about" link>
                                    <v-list-item-content>
                                        A propos
                                    </v-list-item-content>
                                </v-list-item>
                                <v-list-item router to="/work" link>
                                    <v-list-item-content>
                                        Ce que nous faisons
                                    </v-list-item-content>
                                </v-list-item>

                                <v-list-item router to="/structure" link>
                                    <v-list-item-content>
                                        Structure de gestion
                                    </v-list-item-content>
                                </v-list-item>
                                <v-list-item router to="/don" link>
                                    <v-list-item-content>
                                        Nous faire un don
                                    </v-list-item-content>
                                </v-list-item>
                              
                            </v-list>
                           
                          </div>

                        </v-flex>
                      </v-layout>
                        <div class="mr-1">
                            
                        </div>

                    </v-flex>

                    <v-flex xs12 sm12 md4 lg4>
                      <v-container grid-list-xs>
                          <v-list>
                            <v-list-item-title><h4>Contact pour info</h4></v-list-item-title>
                          </v-list>
                      </v-container>
                      <v-layout row wrap>
                        <v-flex xs12 sm12 md6 lg6>
                          <div class="mr-1">

                            <v-list>
                                <v-list-item router to="/teamMember" link>
                                    <v-list-item-content>
                                        Notre groupe
                                    </v-list-item-content>
                                </v-list-item>
                                <v-list-item router to="/articles" link>
                                    <v-list-item-content>
                                        Nos articles
                                    </v-list-item-content>
                                </v-list-item>

                                <v-list-item router to="/meteo" link>
                                    <v-list-item-content>
                                        Metéo
                                    </v-list-item-content>
                                </v-list-item>
                                <v-list-item router to="/map" link>
                                    <v-list-item-content>
                                        Localisation
                                    </v-list-item-content>
                                </v-list-item>
                            </v-list>
                          </div>

                        </v-flex>

                        <v-flex xs12 sm12 md6 lg6>
                          <div class="mr-1">
                            
                           
                            <v-list>
                                <v-list-item link>
                                    <v-list-item-content>
                                        Email: {{sitInfoList.email}}
                                    </v-list-item-content>
                                </v-list-item>
                                <v-list-item link>
                                    <v-list-item-content>
                                        N° de téléphone: {{sitInfoList.tel1}}
                                    </v-list-item-content>
                                </v-list-item>

                                <v-list-item link>
                                    <v-list-item-content>
                                        N° de téléphone 2: {{sitInfoList.tel2}}
                                    </v-list-item-content>
                                </v-list-item>
                                <v-list-item router to="/contact" link>
                                    <v-list-item-content>
                                        Nous écrire
                                    </v-list-item-content>
                                </v-list-item>
                              
                            </v-list>
                          
                          </div>

                        </v-flex>
                      </v-layout>
                        <div class="mr-1">
                            
                        </div>

                    </v-flex>

                    
                </v-layout>
            
          </v-container>
        </v-card-text>
        <v-divider></v-divider>
        <v-card-text class="text-center">
          
            <div class="container">
                <div class="copyright">
                    <p>{{ new Date().getFullYear() }} — Conçu et développé par <a href="https://dreamofdrc.com/" rel="nofollow" target="_blank" style="text-decoration: none;">Dream of
                            drc</a></p>

                    


                </div>
            </div>
        </v-card-text>

        


      </v-card>
    </v-footer>
  </v-container>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
export default {
  name: "Header",
  data(){
    return{
       titre: "",
    }
  },
  computed: {
    ...mapGetters(["sitInfoList", "isloading"]),
  },
  methods:{
    ...mapActions(["getInfoSite"]),

    redirect(url){
        window.open(url);
    }

  },
  created(){
    this.getInfoSite();
  },

};
</script>