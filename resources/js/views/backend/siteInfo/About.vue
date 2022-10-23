<template>
    <div>
        <v-layout row wrap>
            <v-flex xs12 sm12 md8 lg8>
                <div class="mr-1">


                    <!-- debit -->
                    <div class="col-md-12">
                        <div class="text-center">
                            <h3 class="text-center">A propos de nous!</h3>
                        </div>

                        
                        <div v-for="item in basicInfoList" :key="item.id" class="col-md-12">
                            
                            <div class="col-md-12 col-12 col-lg-12 col-sm-12 text-justify" v-html="item.apropos">
                                
                            </div>
                        </div>
                        

                    </div>

                    <div class="col-md-12">

                            <!-- mission et objectif -->
                        
                        <section id="features2" class="feature-section">
                            <div class="container">
                                
                                <div class="row">


                                    <div class="col-lg-6 col-md-6">
                                        <v-card>
                                            <v-card-text>
                                                <div class="single-feature">
                                                    <div class="feature-icon color-2 text-center">
                                                        <v-btn icon>
                                                            <v-icon>home</v-icon>
                                                        </v-btn>
                                                    </div>
                                                    <div class="feature-content">
                                                        <h4>Notre mission</h4>
                                                        <p>
                                                            {{sitInfoList.mission}}
                                                        </p>
                                                    </div>
                                                </div>
                                            </v-card-text>
                                        </v-card>
                                    </div>

                                    <div class="col-lg-6 col-md-6">
                                        <v-card>
                                            <v-card-text>
                                                <div class="single-feature">
                                                    <div class="feature-icon color-2 text-center">
                                                       <v-btn icon>
                                                        <v-icon>check</v-icon>
                                                       </v-btn>
                                                    </div>
                                                    <div class="feature-content">
                                                        <h4>Notre objectif</h4>
                                                        <p>
                                                            {{sitInfoList.objectif}}
                                                        </p>
                                                    </div>
                                                </div>
                                            </v-card-text>
                                        </v-card>
                                    </div>



                                </div>
                            </div>
                        </section>

                        <!-- fin mission et objectif -->

                    </div>
                    <!-- fin -->

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
import SideBar  from './SideBar.vue'

export default {
    components:{
        SideBar,
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

