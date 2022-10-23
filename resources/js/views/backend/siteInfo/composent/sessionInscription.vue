<template>
    <div>

        <div class="text-center">
            <span class="text-h5">{{titre}}</span>
           <p>
            Fiche d'identification
           </p>
            
        </div>

        <v-container grid-list-xs>

           <v-container>

                <v-layout row wrap>

                    <!-- debit -->
                   

                    <v-flex xs12 sm12 md6 lg6>
                        
                        <div class="mr-2 mb-2">
                            <v-card >
                               
                                <div class="container text-h6">
                                    Hello, tu souhaites t'inscrire pour prendre connaissance avec tes frères legas!
                                    
                                </div>
                                
                                <v-card-text>

                                    <p>
                                       Tu es lega, tu es mon frère, où que tu sois que la distance ne nous separe pas.
                                       Nous sommes ravis et très heureux de te revoir parmis nous. en vous inscrivant nous serons
                                       en contact et  nous te mettrons au courant de tout ce qui se passe dans notre communauté!
                                        &nbsp;&nbsp;&nbsp;
                                       

                                        <router-link to="/login_lega" class="btn btn-warning btn-sm" >
                                            Appuyez ici pour completer votre fiche d'identification ↵</router-link> 
                                    </p>
                                    
                                </v-card-text>
                            </v-card>
                        </div>
                    </v-flex>


                    <v-flex xs12 sm12 md6 lg6>
                        
                        <div class="mr-2 mb-2">
                            <v-card >
                               
                                <div class="container text-h6">
                                     Comment s'inscrire et rejoindre notre communauté lega? 
                                     
                                </div>
                                <v-card-text>

                                   

                                    <p>
                                         
                                        Cliquer sur le lien en bas et compéter votre fiche d'identité 
                                        en renseignant votre nom complet, Email, N° de téléphone, Territoire d’origine,
                                         chefferie ou secteur d’origine, grouppement ou clan et nous serons comptamps de vous avoir comme frère ou soeur!
                                       
                                        <router-link to="/register_lega">Appuyez ici  pour démarrer votre inscription  ↵</router-link>
                                    </p>
                                    <br /><br />
                                    
                                </v-card-text>
                            </v-card>
                        </div>
                    </v-flex>
                
                    <!-- fin -->
                    
                </v-layout>
            
           </v-container>

            
        </v-container>

       


       
    </div>
</template>
<script>
import { mapGetters, mapActions } from "vuex";
export default {
    data(){
        return{
            titre:"Et pour t'aider à faire tout ça",
            serviceList:[],
            fetchData: null,
            query: "",
            loading: false,
            disabled: false,
        }
    },
    computed: {
        ...mapGetters(["basicList", "isloading"]),
    },
    methods:{

        ...mapActions(["getBasic"]),

        onPageChange() {
            this.fetch_data(`${this.apiBaseURL}/getVideo?page=`);
        },
        
    },
    created(){
        this.onPageChange();
    }
}
</script>

