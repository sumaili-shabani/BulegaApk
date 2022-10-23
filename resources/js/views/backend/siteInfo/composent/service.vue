<template>
    <div>

        <div class="text-center">
            <span class="text-h5">{{titre}}</span>
           
            
        </div>

        <v-container grid-list-xs>

           <v-container grid-list-xs>

                <v-layout row wrap>
                    <v-flex xs12 sm12 md12 lg12 v-for="item in serviceList" :key="item.id">
                        <div class="mr-2 mb-2">

                            <v-card>
                                
                                <div class="text-center">
                                    <v-avatar
                                        size="40"
                                        color="white"
                                    >
                                        <v-icon>{{item.icone}}</v-icon>
                                    </v-avatar>
                                </div>
                                
                                <v-card-text>
                                   
                                    <div class="text-center">
                                        <span class="text-uppercase text-h8"><strong>{{item.titre}}</strong></span>
                                    </div>
                                    
                                    {{item.description}}
                                </v-card-text>
                            </v-card>

                        </div>
                    </v-flex>
                </v-layout>
            
           </v-container>

            
        </v-container>

       


       
    </div>
</template>
<script>
export default {
    data(){
        return{
            titre:"Nos Services",
            serviceList:[],
        }
    },
    methods:{
        showService(){
            this.editOrFetch(`${this.apiBaseURL}/fetch_services`).then(
                ({ data }) => {
                    var donnees = data.data;
                    this.serviceList = donnees;

                }
            );
        }
    },
    created(){
        this.showService();
    }
}
</script>

