<template>
    <div>
        <div class="text-center">
           <h5> Suivez nos actualités </h5>
           <p>
            <span>Explorez plus sur nos actualités à la une</span>
           </p>

           
        </div>
       <v-container grid-list-xs>
            <v-divider></v-divider>
            <v-layout row wrap>
                <v-flex xs12 sm12 md4 lg4>
                    <div class="mr-1">
                        <v-list>
                            <v-list-item router to="/" link>
                                <v-list-tile-content>
                                    Accueil
                                </v-list-tile-content>
                            </v-list-item>
                            <v-list-item router to="/galery_photo" link>
                                <v-list-tile-content>
                                    Galerie
                                </v-list-tile-content>
                            </v-list-item>

                            <v-list-item router to="/video" link>
                                <v-list-tile-content>
                                    Vidéo
                                </v-list-tile-content>
                            </v-list-item>
                            <v-list-item router to="/contact" link>
                                <v-list-tile-content>
                                    Contact
                                </v-list-tile-content>
                            </v-list-item>
                        </v-list>
                    </div>

                </v-flex>

                <v-flex xs12 sm12 md4 lg4>
                    <div class="mr-1">
                        <v-list>
                            <v-list-item router to="/about" link>
                                <v-list-tile-content>
                                    A propos
                                </v-list-tile-content>
                            </v-list-item>
                            <v-list-item router to="/work" link>
                                <v-list-tile-content>
                                    Ce que nous faisons
                                </v-list-tile-content>
                            </v-list-item>

                            <v-list-item router to="/structure" link>
                                <v-list-tile-content>
                                    Structure de gestion
                                </v-list-tile-content>
                            </v-list-item>
                            <v-list-item router to="/don" link>
                                <v-list-tile-content>
                                    Nous faire un don
                                </v-list-tile-content>
                            </v-list-item>
                           
                        </v-list>
                    </div>

                </v-flex>

                <v-flex xs12 sm12 md4 lg4>
                    <div class="mr-1">
                        <v-list>
                            <v-list-item router to="/teamMember" link>
                                <v-list-tile-content>
                                    Notre groupe
                                </v-list-tile-content>
                            </v-list-item>
                            <v-list-item router to="/articles" link>
                                <v-list-tile-content>
                                    Nos articles
                                </v-list-tile-content>
                            </v-list-item>

                            <v-list-item router to="/login_lega" v-if="userData.id_role == null"  link>
                                <v-list-tile-content>
                                    Se connecter
                                </v-list-tile-content>
                            </v-list-item>
                            <v-list-item router to="/register_lega" v-if="userData.id_role == null" link>
                                <v-list-tile-content>
                                    S'enregistrer
                                </v-list-tile-content>
                            </v-list-item>
                        </v-list>
                    </div>

                </v-flex>
           </v-layout>
        
       </v-container>

       <v-divider></v-divider>
        <!-- menu article -->
        <MenublogSlide />
        <!-- fin menu article -->

        

          
    </div>
</template>

<script>
import MenublogSlide from './MenublogSlide.vue'
export default {
    components:{
        MenublogSlide,
    },
    data(){
        return{
            search:false
        }
    },
    
    methods:{
        
    },
    created()
    {

    }
    

}
</script>

