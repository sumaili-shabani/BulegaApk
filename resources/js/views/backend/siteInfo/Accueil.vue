<template>
    <div>
        <v-layout row wrap>
            <v-flex xs12 sm12 md8 lg8>
                <v-container grid-list-xs> 

                    
                   <v-layout row wrap>
                        <!-- cool -->
                        <v-flex xs12 sm12 md12 lg12>
                            <div class="mr-1">
                                <Carousel />
                            </div>
                        </v-flex>
                        <!-- cool -->

                        <!-- Inscription -->
                        <v-flex xs12 sm12 md12 lg12>
                            <div class="mr-1">
                                <Inscription />
                            </div>
                        </v-flex>
                        <!-- service -->

                         <!-- service -->
                         <v-flex xs12 sm12 md12 lg12>
                            <div class="mr-1">
                                <Services />
                            </div>
                        </v-flex>
                        <!-- service -->

                        

                         <!-- PetitArticleVue -->
                         <v-flex xs12 sm12 md12 lg12>
                            <div class="mr-1">
                                <PetitArticleVue />
                            </div>
                        </v-flex>
                        <!-- PetitArticleVue -->

                        <!-- Galerie -->
                        <v-flex xs12 sm12 md12 lg12>
                            <div class="mr-1">
                                <Galerie />
                            </div>
                        </v-flex>
                        <!-- Galerie -->


                        <!-- Partenaire -->
                        <v-flex xs12 sm12 md12 lg12>
                            <div class="mr-1">
                                <Partenaire />
                            </div>
                        </v-flex>
                        <!-- Partenaire -->
                   </v-layout>
                    
                </v-container>
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
import SideBar  from './SideBar.vue'
import Carousel from './composent/Carousel.vue'
import Services from './composent/service.vue'
import Inscription from './composent/sessionInscription.vue'
import Partenaire from './composent/partenaire.vue';
import Galerie from "./composent/galerie.vue";
import PetitArticleVue from './composent/petitArticle.vue';


export default {
    components:{
        SideBar,
        Carousel,
        Services,
        Inscription,
        Partenaire,
        Galerie,
        PetitArticleVue,
    },
    data(){
        return{
            title:"about",
            query: "",
            dialog: false,
            loading: false,
            disabled: false,
            edit: false,
        }
    },
    computed: {
      ...mapGetters(["basicInfoList","sitInfoList","categoryArticleList", "isloading"]),
    },
    methods:{
        ...mapActions(["getInfoBasic","getInfoSite","getCategyArticle"]),

    },
    created(){

        this.getInfoSite();
        this.getInfoBasic();
        this.getCategyArticle();

    }
}
</script>

<style scoped>
.v-application .rounded-bl-xl {
    border-bottom-left-radius: 300px !important;
}
.v-application .rounded-br-xl {
    border-bottom-right-radius: 300px !important;
}
</style>

