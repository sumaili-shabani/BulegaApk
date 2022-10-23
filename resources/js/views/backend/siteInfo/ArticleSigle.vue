<template>
    <div>
        <v-layout row wrap>
            <v-flex xs12 sm12 md8 lg8>
                <div class="mr-1">


                    <!-- debit -->
                 
                    <v-container grid-list-xs>
                        <v-layout row wrap class="mt-2" v-for="item in blogSingleList" :key="item.id">
                            <v-flex xs12 sm12 md12 lg12 >
                                <div class="mr-2 mb-2">

                                    <v-avatar
                                        tile 
                                        size="100%"
                                        color="blue lighten-5"
                                    >
                                        <img 
                                            :src="
                                                item.photo == null
                                                ? `${baseURL}/article/vuetify.png`
                                                : `${baseURL}/article/` + item.photo
                                            "
                                            alt="alt">
                                    </v-avatar>

                                </div>
                                
                            </v-flex>

                           <v-divider></v-divider>
                           <v-flex xs12 sm12 md12 lg12>
                                <div class="mr-1">
                                    <div>
                                        <h2> {{ item.titre  }}</h2>
                                    </div>
                                    
                                   
                                </div>
                                <div class="mr-1 text-justify" v-html="item.description">
                                   
                                </div>
                                <v-divider></v-divider>
                                <div class="container text-center">
                                   
                                   <div class="col-md-12 mt-1 mb-2">

                                    
                                       <!-- debit  -->
                                       <template  class="form-inline d-flex mr-3">
                                           <h2>Le partager sur:</h2>

                                           <a :href="facebookURL" target="_blank" style="text-decoration: none;"
                                               class="btn btn-outline-primary my-2 mr-2 my-sm-0">
                                               <v-icon>fa-facebook</v-icon> Facebook
                                           </a> |

                                           <a :href="twitterURL" target="_blank" style="text-decoration: none;"
                                               class="btn btn-outline-primary my-2 mr-2 my-sm-0">
                                                <v-icon>fa-twitter</v-icon> Twitter
                                           </a> |

                                           <a :href="linkedinURL" target="_blank" style="text-decoration: none;"
                                               class="btn btn-outline-primary my-2 mr-2 my-sm-0">
                                                <v-icon>fa-linkedin</v-icon> LinkedIn
                                           </a>


                                          
                                       </template>
                                       <!-- fin -->

                                       <v-list>
                                        <v-list-item>

                                            <v-list-item-avatar>
                                                <img
                                                    style="border-radius: 50px; width: 50px; height: 50px"
                                                    :src="
                                                        item.avatar == null
                                                        ? `${baseURL}/images/avatar.png`
                                                        : `${baseURL}/images/` + item.avatar
                                                    "
                                                />
                                            </v-list-item-avatar>
                                            <v-list-item-content>
                                                {{item.name}}

                                            </v-list-item-content>

                                            <v-list-item-action>
                                                {{ item.created_at | formatDate }}
                                                {{ item.created_at | formatHour }}
                                            </v-list-item-action>



                                        </v-list-item>
                                       </v-list>

                                      

                                   </div>



                               </div>
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
            fetchData: null,
            etatView:false,
            selection: 1,
            url: this.$route.params.slug,
            text: '',
            facebookURL: '',
            twitterURL: '',
            linkedinURL: '',
            success: false
        }
    },
    computed: {
        ...mapGetters(["basicInfoList","sitInfoList","categoryArticleList","blogSingleList", "isloading"]),
        encodedURL() {
            return encodeURIComponent(this.url);
        },
        encodedText() {
            return encodeURIComponent(this.text);
        },
    },
    methods:{
        ...mapActions(["getInfoBasic","getInfoSite","getCategyArticle","getSigleBLOGInfos"]),

        generateURLs(event) {
            if (event.target.checkValidity()) {
                this.success = true;
                this.facebookURL =  'http://www.facebook.com/sharer/sharer.php?u=' + this.encodedURL + '&title=' + this.encodedText;
                this.twitterURL =  'https://twitter.com/intent/tweet?text=' + this.encodedText + '&url=' + this.encodedURL;
                this.linkedinURL = 'http://www.linkedin.com/shareArticle?mini=true&url=' + this.encodedURL + '&title=' + this.encodedText;
            }
        },

        ShareGenerateURLs() {
            this.success = true;
            this.facebookURL =  'http://www.facebook.com/sharer/sharer.php?u=' + this.encodedURL + '&title=' + this.encodedText;
            this.twitterURL =  'https://twitter.com/intent/tweet?text=' + this.encodedText + '&url=' + this.encodedURL;
            this.linkedinURL = 'http://www.linkedin.com/shareArticle?mini=true&url=' + this.encodedURL + '&title=' + this.encodedText;
        },

        showDataRandom() {
            this.editOrFetch(`${this.apiBaseURL}/getSingleBlog/${this.$route.params.slug}`).then(
                ({ data }) => {
                    var donnees = data.data;
                    this.dataList = donnees;

                    this.text = donnees[0].titre;
                    this.url = this.baseURL+''+this.$route.fullPath;
                  
                    this.ShareGenerateURLs();

                }
            );
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
        this.$store.dispatch("getSigleBLOGInfos", this.$route.params.slug);
        this.showDataRandom();
        

    }
}
</script>

