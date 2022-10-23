<template>
    <div>
        <v-layout row wrap>

            <div class="col-md-12 text-center">
                <span class="text-h5">Nos recentes publications</span>
                <p>
                    Explorez nos publications  à la une!
                </p>
                
            </div>
             <!-- debit -->
             <div class="col-md-12">
                      
                <v-container grid-list-xs>
                    <v-layout row wrap class="mt-1">
                        <v-flex xs12 sm12 md6 lg6 v-for="item in fetchData" :key="item.id">
                            <div class="mr-2">

                                <!-- formulaire -->
                                <v-card
                                    :loading="loading"
                                    class="mx-auto my-2"
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
                                :total-visible="0"
                                @input="onPageChange"
                            ></v-pagination>
                        </div>
                        
                    </v-flex>
                </v-layout>

                

            </div>

            <!-- fin -->


        </v-layout>
    </div>
</template>
<script>
import { mapGetters, mapActions } from "vuex";

export default {
    components:{

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
      ...mapGetters(["basicInfoList","sitInfoList","categoryArticleList","blogSingleList", "isloading"]),
    },
    methods:{
        ...mapActions(["getInfoBasic","getInfoSite","getCategyArticle","getSigleBLOGInfos"]),

        searchMember: _.debounce(function () {
            this.onPageChange();
        }, 300),
        onPageChange() {
            this.fetch_data(`${this.apiBaseURL}/fetch_blog?page=`);
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

    }
}
</script>

