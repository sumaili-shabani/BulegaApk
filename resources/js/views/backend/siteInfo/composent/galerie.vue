<template>
    <div>

        <div class="text-center">
            <span class="text-h5">{{titre}}</span>
           <p>
             Explorez nos récents événements!
           </p>
            
        </div>

        <v-container grid-list-xs>

           <v-container>

                <v-row>

                    <v-col v-for="item in fetchData" :key="item.id" class="d-flex child-flex mb-2" cols="12" sm="6">
                        <v-card flat tile class="d-flex">

                            <v-avatar
                                tile 
                                size="100%"
                                color="blue lighten-5"
                            >
                                <img 
                                    :src="item.photo== null || item.photo==''
                                    ? `${baseURL}/images/avatar.png`
                                    : `${baseURL}/galery/` + item.photo
                                " 
                                    alt="alt">
                            </v-avatar> 
                            
                            
                            
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

            
        </v-container>

       


       
    </div>
</template>
<script>
import { mapGetters, mapActions } from "vuex";
export default {
    data(){
        return{
            titre:"Notre Galerie",
            serviceList:[],
            fetchData: null,
            query: "",
        }
    },
    computed: {
        ...mapGetters(["basicList", "isloading"]),
    },
    methods:{

        ...mapActions(["getBasic"]),

        onPageChange() {
            this.fetch_data(`${this.apiBaseURL}/getImages?page=`);
        },
        
    },
    created(){
        this.onPageChange();
    }
}
</script>

