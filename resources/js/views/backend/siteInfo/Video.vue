<template>
    <div>
        <v-layout row wrap>
            <v-flex xs12 sm12 md8 lg8>
                <div class="mr-1">


                    <!-- debit -->
                    <div class="col-md-12">
                        <div class="text-center mb-4">
                            <h3 class="text-center">Nos vidéos !</h3>
                            <p>
                                Explorez nos vidéos ! vous pouvez aussi <a href="javascript:void(0);" style="text-decoration: none;" @click="etatView = !etatView">
                                    Rechercher une de nos vidéos
                                </a>
                            </p>
                            
                        </div>

                        <div class="row">
           

                            <!-- recherche -->
                            <div class="col-12" v-show="etatView">
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
                                    <v-flex md10>
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
                                    <v-flex md1></v-flex>
                        
                                   
                                </v-layout>
                                <!-- bande -->
                            </div>
                            <br>
                            <!-- fin recherche -->

                        </div>

                       
                       <v-container grid-list-xs>
                        <v-layout row wrap class="mt-2">
                            <v-flex xs12 sm12 md6 lg6 v-for="item in fetchData" :key="item.id">
                                <div class="mr-2 mb-2">

                                   <v-card>
                                    <v-card-text>
                                        <v-layout row wrap>
                                            <v-flex xs12 sm12 md12 lg12>
                                                <div class="embed-responsive embed-responsive-16by9">
                                                    <iframe class="embed-responsive-item" 
                                                    :src="item.url" style="width: 100%;" allowfullscreen></iframe>
                                                </div>
                                                
                                            </v-flex>
                                            <v-flex xs12 sm12 md12 lg12>
                                                <div class="text-center">
                                                    <h5>
                                                        {{item.titre}}
                                                    </h5>
                                                </div>
                                                
                                            </v-flex>
                                        </v-layout>
                                    </v-card-text>
                                   </v-card>

                                </div>
                                
                            </v-flex>

                           <v-divider></v-divider>

                            
                        </v-layout>
                       </v-container>
                        <v-layout row wrap>
                            <v-flex xs12 sm12 lg12>

                                <div class="text-center">
                                    <v-pagination
                                        color="primary"
                                        v-model="pagination.current"
                                        :length="pagination.total"
                                        @input="onPageChange"
                                    ></v-pagination>
                                </div>
                                
                            </v-flex>
                        </v-layout>

                      

                       
                        

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
            fetchData: null,
            etatView:false,
        }
    },
    computed: {
      ...mapGetters(["basicInfoList","sitInfoList","categoryArticleList", "isloading"]),
    },
    methods:{
        ...mapActions(["getInfoBasic","getInfoSite","getCategyArticle"]),

        searchMember: _.debounce(function () {
            this.onPageChange();
        }, 300),
        onPageChange() {
            this.fetch_data(`${this.apiBaseURL}/fetch_video?page=`);
        },

    },
    created(){

        this.getInfoSite();
        this.getInfoBasic();
        this.getCategyArticle();
        this.onPageChange();

    }
}
</script>

