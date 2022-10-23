<template>
    <div>
        <v-layout row wrap>
            <v-flex xs12 sm12 md8 lg8>
                <div class="mr-1">


                    <!-- debit -->
                    <div class="col-md-12">
                        <div class="text-center mb-4">
                            <h3 class="text-center">Nos recentes publications  !</h3>
                            <p>
                                Explorez nos publications ! vous pouvez aussi <a href="javascript:void(0);" style="text-decoration: none;" @click="etatView = !etatView">
                                    Rechercher un de nos artcles
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
                           
                            <!-- fin recherche -->

                        </div>

                       
                       <v-container grid-list-xs>
                        <v-layout row wrap class="mt-1">
                            <v-flex xs12 sm12 md6 lg6 v-for="item in CategorySlug" :key="item.id">
                                <div class="mr-2">

                                    <!-- formulaire -->
                                    <v-card
                                        :loading="loading"
                                        class="mx-auto my-12"
                                        max-width="374"
                                    >
                                        <template slot="progress">
                                        <v-progress-linear
                                            color="deep-purple"
                                            height="10"
                                            indeterminate
                                        ></v-progress-linear>
                                        </template>

                                        <v-img
                                            height="250"
                                            :src="
                                                item.photo == null
                                                ? `${baseURL}/article/vuetify.png`
                                                : `${baseURL}/article/` + item.photo
                                            "
                                        ></v-img>

                                        <v-card-title>{{ item.titre | subStrLong2 }}</v-card-title>

                                        <v-card-text>
                                        <v-row
                                            align="center"
                                            class="mx-0"
                                        >
                                            <v-rating
                                                :value="4.5"
                                                color="amber"
                                                dense
                                                half-increments
                                                readonly
                                                size="14"
                                            ></v-rating>

                                            <div class="grey--text ms-4">
                                                {{ item.created_at | formatDate }}
                                                {{ item.created_at | formatHour }}
                                            </div>
                                        </v-row>

                                        <div class="my-4 text-subtitle-1">
                                           publié par {{ item.name | subStrLong2 }}
                                        </div>
                                        {{ item.titre  }}
                                      
                                        </v-card-text>

                                        <v-card-actions>
                                            <v-btn
                                                color="deep-purple lighten-2"
                                                text
                                                @click=" gotoBlog(item.slug)"
                                            >
                                                Lire plus
                                            </v-btn>
                                            <v-spacer></v-spacer>

                                            <v-avatar
                                                size="avatarSize"
                                                color="red"
                                            >
                                            <img
                                                style="border-radius: 50px; width: 50px; height: 50px"
                                                :src="
                                                    item.avatar == null
                                                    ? `${baseURL}/images/avatar.png`
                                                    : `${baseURL}/images/` + item.avatar
                                                "
                                            />
                                            </v-avatar>

                                        </v-card-actions>
                                    </v-card>
                                    <!-- fin formulaire -->

                                </div>
                                
                            </v-flex>

                        

                            
                        </v-layout>
                       </v-container>
                        <v-layout row wrap>
                            <v-flex xs12 sm12 lg12>

                                <div class="text-center">
                                    <v-pagination
                                        color="primary"
                                        v-model="pagination.current"
                                        :length="pagination.total"
                                        :total-visible="7"
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
            selection: 1,
        }
    },
    computed: {
      ...mapGetters(["basicInfoList","sitInfoList","categoryArticleList","blogSingleList","CategorySlug", "isloading"]),
    },
    methods:{
        ...mapActions(["getInfoBasic","getInfoSite","getCategyArticle","getSigleBLOGInfos", "CatgetSigleBLOGInfos"]),

        searchMember: _.debounce(function () {
            this.onPageChange();
        }, 300),
        onPageChange() {
            var slug = this.$route.params.slug;
            this.fetch_data(`${this.apiBaseURL}/showArticleCategoryPagination/${slug}?page=`);
        },

        gotoBlog(slug)
        {
            this.$router.push({ path: `/article/${slug}` });
            this.$store.dispatch("getSigleBLOGInfos", slug);
        },

    },
    created(){

        this.getInfoSite();
        this.getInfoBasic();
        this.getCategyArticle();
        this.onPageChange();
        this.$store.dispatch("CatgetSigleBLOGInfos", this.$route.params.slug);

    }
}
</script>

