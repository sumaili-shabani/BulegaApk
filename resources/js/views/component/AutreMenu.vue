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
                                <v-list-item-content>
                                    Accueil
                                </v-list-item-content>
                            </v-list-item>
                            <v-list-item router to="/galery_photo" link>
                                <v-list-item-content>
                                    Galerie
                                </v-list-item-content>
                            </v-list-item>

                            <v-list-item router to="/login_lega" v-if="userData.id_role == null"  link>
                                <v-list-item-content>
                                    Se connecter
                                </v-list-item-content>
                            </v-list-item>
                            <v-list-item router to="/register_lega" v-if="userData.id_role == null" link>
                                <v-list-item-content>
                                    S'enregistrer
                                </v-list-item-content>
                            </v-list-item>

                            <v-list-item router to="/structure"  link>
                                <v-list-item-content>
                                    Nos remerciements
                                </v-list-item-content>
                            </v-list-item>

                            
                        </v-list>
                    </div>

                </v-flex>

                <v-flex xs12 sm12 md4 lg4>
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

                <v-flex xs12 sm12 md4 lg4>
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

                           
                            <v-list-item router to="/don" link>
                                <v-list-item-content>
                                    Nous faire un don
                                </v-list-item-content>
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

