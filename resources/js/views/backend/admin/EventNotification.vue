<template>
    <v-layout wrap row>

        <v-flex xs12 sm12 md4 lg4>

            <!-- bande -->

            <!-- bande -->

            <v-container grid-list-xs>
                <v-layout row wrap>
                    <v-flex xs12 sm12 md12 lg12>
                        <div class="mr-1">
                            <v-text-field append-icon="search" label="Recherche..." single-line solo outlined rounded
                                hide-details v-model="query" @keyup="searchMember" clearable dense></v-text-field>
                        </div>
                    </v-flex>

                    <v-flex xs12 sm12 md12 lg12>
                        <div class="mr-1 text-center">
                           Mes notifications !
                        </div>
                        <v-divider></v-divider>
                    </v-flex>

                    <v-flex xs12 sm12 md12 lg12>
                        <div class="mr-1">
                            <v-card class="text-center mt-8 mb-3" shaped>
                                <v-badge bordered bottom color="green" dot offset-x="11" offset-y="13">
                                    <v-avatar class="mt-n7" size="60" elevation="10">
                                        <img 
                                        :src="
                                            userData.avatar == null
                                            ? `${baseURL}/images/avatar.png`
                                            : `${baseURL}/images/` + userData.avatar
                                        "
                                            />
                                    </v-avatar>
                                </v-badge>
                                <v-card-title class="layout justify-center">{{userData.name}}</v-card-title>
                                <v-card-subtitle class="layout justify-center">
                                    <div>Sexe: {{userData.sexe}}</div> 
                                    <div>Email: {{userData.email}}</div> <br />
                                    
                                </v-card-subtitle>
                                
                                
                                <v-list>
                                </v-list>
                            </v-card>
                        </div>
                    </v-flex>
                   
                </v-layout>
            </v-container>

        </v-flex>
        <v-flex xs12 sm12 md8 lg8>

            <v-flex md12>

                <v-card flat :loading="loading" :disabled="isloading">
                    <v-card-text>


                        <!-- liste de notification -->
                        <v-list subheader two-line>

                            <v-list-item v-for="item in fetchData" :key="item.id">
                                <v-list-item-avatar>
                                    <v-btn icon fab small>
                                        <v-icon color="primary">
                                            notifications
                                        </v-icon>
                                    </v-btn>
                                </v-list-item-avatar>

                                <v-list-item-content>
                                    <v-list-item-title v-text="item.nom"></v-list-item-title>

                                    <v-list-item-subtitle>
                                        Vous avez été selectionné pour faire part
                                        le
                                        {{ item.start_date }} -
                                        {{ item.end_date }} à
                                        {{ item.hours }}
                                    </v-list-item-subtitle>
                                </v-list-item-content>

                                <v-list-item-action>

                                    <v-menu open-on-hover left offset-y>
                                        <template v-slot:activator="{ on, attrs }">
                                            <v-btn icon v-bind="attrs" v-on="on">
                                                <v-icon>mdi-dots-vertical</v-icon>
                                            </v-btn>
                                        </template>

                                        <v-list>
                                            <v-list-item @click="gotoMeeting(item.slug)">
                                                <v-list-item-title>
                                                    <v-icon>visibility</v-icon> Participer
                                                </v-list-item-title>
                                            </v-list-item>
                                            <v-list-item @click="clearP(item.id)">
                                                <v-list-item-title>
                                                    <v-icon>delete</v-icon> Supprimer
                                                </v-list-item-title>
                                            </v-list-item>
                                        </v-list>
                                    </v-menu>




                                </v-list-item-action>

                            </v-list-item>

                        </v-list>
                        <v-divider></v-divider>
                        <!-- fin de la liste -->

                        <v-pagination color="primary" v-model="pagination.current" :length="pagination.total"
                            :total-visible="0" @input="onPageChange"></v-pagination>
                    </v-card-text>
                </v-card>

                <!-- les composants -->

                <!-- fin des composants -->
            </v-flex>

        </v-flex>


    </v-layout>
</template>
  
<script>
import { mapGetters, mapActions } from "vuex";
export default {
    components: {},
    data() {
        return {
            header: "crud operation",
            titleComponent: "",
            query: "",
            dialog: false,
            loading: false,
            disabled: false,
            edit: false,
            style: {
                height: "0px",
            },
            svData: {
                id: "",
                titre: "",
                description: "",
            },
            fetchData: null,
            titreModal: "",
            image: "",
        };
    },

    computed: {
        ...mapGetters(["basicList", "MeetingSlug","isloading"]),
    },
    methods: {
        ...mapActions(["getBasic","getMeetingSlug",]),



        searchMember: _.debounce(function () {
            this.onPageChange();
        }, 300),
        onPageChange() {
            var id = this.userData.id;
            this.fetch_data(`${this.apiBaseURL}/showNotificationUser/${id}?page=`);
        },

        gotoMeeting(slug)
        {
            this.$router.push({ path: `/meeting/${slug}` });
            this.$store.dispatch("getMeetingSlug", slug);
        },


        clearP(id) {
            this.confirmMsg().then(({ res }) => {
                this.delGlobal(`${this.apiBaseURL}/delete_reunion/${id}`).then(
                    ({ data }) => {
                        this.successMsg(data.data);
                        this.onPageChange();
                    }
                );
            });
        },


    },
    created() {
        this.onPageChange();
        this.testTitle();
        this.onPageChange();
    },
};
</script>
  
<style scoped>
.mb-2 {
    margin-top: 10px;
}
</style>