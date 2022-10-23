<template>
    <div>
        <v-layout row wrap>
            <v-flex xs12 sm12 md8 lg8>
                <div class="mr-1">


                    <!-- debit -->
                    <v-container>
                        <h2 class="text-center">Notre famille </h2>
                        <v-row>
                            <v-col v-for="item in fetchData" :key="item.id" class="d-flex child-flex" cols="12" sm="4">
                                <v-card :loading="loading" tile class="mx-auto">
                                <v-img 
                                :src="item.photo== null || item.photo==''
                                    ? `${baseURL}/images/avatar.png`
                                    : `${baseURL}/team/` + item.photo
                                "  aspect-ratio="1" class="grey lighten-2"></v-img>
                                <v-card-text class="text--primary text-center">
                                    <div class="title">{{ item.nom }}</div>
                                    <p>{{ item.titre }}</p>
                                    <p class="primary--text">
                                        <v-icon size="18px" class="primary--text" v-if="item.telephone !=null">phone</v-icon>
                                        <a link :href="'tel:'+item.telephone" size="14px" v-if="item.telephone !=null" style="text-decoration: none;">
                                            
                                            {{item.telephone}}
                                        </a>
                                        
                                    </p>

                                    <v-divider></v-divider>
                                    
                                
                                </v-card-text>
                                <v-card-actions>
                                    <div class="text-center">
                                        <v-btn @click="redirect(item.facebook)"  class="mx-1" icon v-if="item.facebook !=null">
                                            <v-icon size="14px">fa-facebook</v-icon>
                                        </v-btn>
                                        <v-btn @click="redirect(item.twitter)" class="mx-1" icon v-if="item.twitter !=null">
                                            <v-icon size="14px">fa-twitter</v-icon>
                                        </v-btn>
                                        <v-btn  class="mx-1" icon>
                                            <v-icon @click="redirect(item.linkedin)" size="14px" v-if="item.linkedin !=null">fa-linkedin</v-icon>
                                        </v-btn>
                                        <v-btn  class="mx-1" icon>
                                            <a link :href="'mailto:'+item.email" size="14px" v-if="item.email !=null" style="text-decoration: none;">
                                                <v-icon size="14px" v-if="item.email !=null">fa-google-plus</v-icon>
                                            </a>
                                            
                                        </v-btn>

                                    
                                        
                                    </div>
                                </v-card-actions>
                                </v-card>
                            </v-col>
                        </v-row>

                        <v-layout row wrap>

                        <v-flex xs12 sm12 md12 lg12 class="text-center">
                                <v-pagination
                                    color="primary"
                                    v-model="pagination.current"
                                    :length="pagination.total"
                                    :total-visible="7"
                                    @input="onPageChange"
                                ></v-pagination>
                                
                            </v-flex>

                        </v-layout>
                    </v-container>

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
        redirect(url){
            window.open(url);
        },

        onPageChange() {
            this.fetch_data(`${this.apiBaseURL}/fetch_team?page=`);
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

