<template>
    <div>
        <v-layout row wrap>
            <v-flex xs12 sm12 md12 lg12>
                <ProfileComponent ref="ProfileComponent" />
            </v-flex>
        </v-layout>
        <v-layout row wrap>
            <v-flex xs12 md12 lg12 sm12>
                <v-navigation-drawer
                    v-model="drawer"
                    absolute
                    right
                    temporary
                    width="320"
                
                >

                    <v-list-item>
                        
                        <v-list-item-content>
                            <v-text-field
                                append-icon="search"
                                label="Recherche un ceo ..."
                                single-line
                                solo
                                outline
                                round
                                hide-details
                                v-model="query2"
                                @keyup="searchMember2"
                                clearable
                            ></v-text-field>
                            <br>
                        </v-list-item-content>
                    </v-list-item>

                    <v-divider></v-divider>

                    <!--  liste ceo -->
                    <v-list dense>
                        <!-- v-show="data.id == userId ? false : true" -->
                        <v-subheader>Liste des Utilisateurs du système</v-subheader>
                        <v-list-item
                        style="height: 60px"
                        v-for="data in fetchData_2"
                        :key="data.user_id"
                        
                        >
                    
                            <v-list-item-avatar>
                                <userImage :width="40" :height="40" :image="data.avatar" />
                            </v-list-item-avatar>
                            <v-list-item-content>
                                <v-list-item style="position: relative; left: -10px">
                                <b>{{ data.name }}</b>
                                </v-list-item>
                                <div
                                    class="text--primary"  
                                    style="height: 20px;position: relative;top: -8px;padding: 2px;"
                                >
                                {{data.email}}
                                </div>
                                
                            </v-list-item-content>
                            <v-list-item-action v-if="userData.id_role==1 || userData.id_role==2 || userData.id_role==3 ? true :false">
                                <v-btn
                                small
                                :disabled="loading"
                                fab
                                depressed
                                @click="showRoleModal(data.user_id, data.name)"
                                >
                                <v-icon>visibility</v-icon>
                                </v-btn>
                            </v-list-item-action>
                            
                        </v-list-item>
                        <v-divider></v-divider>
                        
                    </v-list>
                    <!-- fin liste ceo -->

                    <v-flex xs12 md12 lg12 sm12>

                        <div class="text-center">
                            <v-pagination
                                color="primary"
                                v-model="pagination.current"
                                :length="pagination.total"
                                :total-visible="0"
                                @input="onPageChangeCeoEntreprise"
                            ></v-pagination>
                        </div>
                        
                    </v-flex>

                
                </v-navigation-drawer>
        </v-flex>
        </v-layout>
    </div>
</template>
<script>
import { mapGetters, mapActions } from "vuex";
import userImage from "../../../../component/userImage.vue";
import ProfileComponent from "../../ProfileComponent.vue";

export default {
    props:["drawer"],
    components:{
        userImage,
        ProfileComponent,

    },
    data(){
        return{
            query2: "",
            fetchData_2:null,
            ListMenu:null,
        }
    },
    computed: {
        ...mapGetters([
            "isloading",
            "paysList",
            "provinceList",
            "user2List",
            "formeJuridiqueList",
            "secteurList",
            "ListeEdition",
            "ListeNBREmploye",
        ]),
    },
    methods:{

        ...mapActions([
            "getPays",
            "getProvince",
            "getUser2",
            "getFormejuridique",
            "getSecteurList"
        ]),

        //fetch ceo
        searchMember2: _.debounce(function () {
            this.onPageChangeCeoEntreprise();
        }, 300),
        onPageChangeCeoEntreprise() {
            this.fetch_data_ceoEntreprise(`${this.apiBaseURL}/AllUserfetch?page=`);
        },

        showRoleModal(id, name) {
            this.$refs.ProfileComponent.$data.dialog = true;
            this.$refs.ProfileComponent.$data.svData.id = id;

            this.$refs.ProfileComponent.$data.titleComponent =
                "Détail du profil de: " + name;
            
            this.$refs.ProfileComponent.showInfoUser(id);
                
        },


    },
    created(){
        this.onPageChangeCeoEntreprise();
    },
}
</script>

