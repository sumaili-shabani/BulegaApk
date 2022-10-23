<template>
    <div>
        <v-layout row wrap>
            <v-flex xs12 sm12 md8 lg8>
                <div class="mr-1">


                    <!-- debit -->
                    <div class="col-md-12">
                        <div class="text-center mb-4">
                            <h3 class="text-center">Notre galerie!</h3>
                        </div>

                       <v-divider></v-divider>
                       <v-container grid-list-xs>
                        <v-layout row wrap class="mt-2">
                            <v-flex xs12 sm12 md6 lg6 v-for="item in fetchData" :key="item.id">
                                <div class="mr-2 mb-2">

                                    <v-avatar
                                        tile 
                                        size="100%"
                                        color="blue lighten-5"
                                    >
                                        <img 
                                            :src="
                                                item.photo == null
                                                ? `${baseURL}/galery/vuetify.png`
                                                : `${baseURL}/galery/` + item.photo
                                            "
                                            alt="alt">
                                    </v-avatar>

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
        }
    },
    computed: {
      ...mapGetters(["basicInfoList","sitInfoList","categoryArticleList", "isloading"]),
    },
    methods:{
        ...mapActions(["getInfoBasic","getInfoSite","getCategyArticle"]),

        onPageChange() {
            this.fetch_data(`${this.apiBaseURL}/fetch_galery?page=`);
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

