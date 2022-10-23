<template>
    <div>
        <v-layout row wrap>
            <v-flex xs12 sm12 md8 lg8>
                <div class="mr-1">


                    <!-- debit -->
                    <div class="col-md-12">
                        <div class="text-center">
                            <h3 class="text-center">Notre Structure de gestion!</h3>
                        </div>

                        
                        <div v-for="item in basicInfoList" :key="item.id" class="col-md-12">
                            
                            <div class="col-md-12 col-12 col-lg-12 col-sm-12 text-justify" 
                            v-html="item.structure">
                                
                            </div>
                        </div>
                        

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

