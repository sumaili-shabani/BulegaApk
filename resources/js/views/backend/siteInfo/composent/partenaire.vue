<template>
    <div>

        <div class="text-center">
            <span class="text-h5">{{titre}}</span>
           <p>
            Ils nous accompagnent  et nous font confiance.
           </p>
            
        </div>

        <v-container grid-list-xs>

           <v-container>

            
                <v-layout row wrap>
                    
                    <div class="container space-top-1 space-top-lg-0">
                        <div class="w-lg-80 mx-lg-auto">
                            <div class="row justify-content-center">


                                <div class="col-4 col-sm-3 col-md mb-4" v-for="item in fetchData" :key="item.id">
                                    <v-card :loading="loading" :disabled="isloading" flat>
                                        <a :href="item.url" target="_blank">
                                                <v-avatar
                                                    tile 
                                                    size="180"
                                                    color="blue lighten-5"
                                                >
                                                    <img class="max-w-11rem max-w-md-13rem mx-auto" 
                                                    :src="item.photo== null || item.photo==''
                                                        ? `${baseURL}/images/avatar.png`
                                                        : `${baseURL}/partenaire/` + item.photo
                                                    " 
                                                alt="Image Description">
                                                </v-avatar>
                                            </a>
                                    </v-card>
                                </div>


                            </div>
                        </div>
                    </div>
                </v-layout>

                <v-layout row wrap>

                   <v-flex xs12 sm12 md12 lg12 class="text-center">
                        <v-pagination
                            color="primary"
                            v-model="pagination.current"
                            :length="pagination.total"
                            :total-visible="0"
                            @input="onPageChange"
                        ></v-pagination>
                        
                    </v-flex>

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
            titre:"Nos partenaires",
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
            this.fetch_data(`${this.apiBaseURL}/fetch_partenaire?page=`);
        },
        
    },
    created(){
        this.onPageChange();
    }
}
</script>

