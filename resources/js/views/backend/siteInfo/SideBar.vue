<template>
    <div>
        <v-layout row wrap>
            <v-flex xs12 sm12 md12 lg12>
                <!-- widget social -->
                <div class="col-md-12">
                    <div class="row g-1">
                        <div class="col-4 mb-2">
                           <v-card>
                            <v-card-text>
                                <a :href="sitInfoList.facebook" target="_blank"
                                    class="bg-facebook rounded text-center text-white-force p-3 d-block">
                                    <i class="fa fa-facebook fs-5 mb-2"></i>
                                    <h6 class="m-0">+1.5K</h6>
                                    <span class="small">Fans</span>
                                </a>
                            </v-card-text>
                           </v-card>
                        </div>
                        <div class="col-4 mb-2">

                            <v-card>
                                <v-card-text>
                                    <a :href="sitInfoList.twitter" target="_blank"
                                        class="bg-facebook rounded text-center text-white-force p-3 d-block">
                                        <i class="fa fa-twitter fs-5 mb-2"></i>
                                        <h6 class="m-0">+1.8M</h6>
                                        <span class="small">Followers</span>
                                    </a>
                                </v-card-text>
                           </v-card>
                            
                        </div>
                        <div class="col-4 mb-2">

                            <v-card>
                                <v-card-text>
                                    <a href="javascript:void(0);"
                                        class="bg-youtube rounded text-center text-white-force p-3 d-block">
                                        <i class="fa fa-youtube fs-5 mb-2"></i>
                                        <h6 class="m-0">+22K</h6>
                                        <span class="small">Subs</span>
                                    </a>
                                </v-card-text>
                           </v-card>
                            
                        </div>
                    </div>
                </div>
                <!-- fin widget social -->
                <v-divider></v-divider>

               
            </v-flex>

            <v-flex xs12 sm12 md12 lg12>

                <div class="col-md-12">
                    <h4>CATEGORIES</h4>

                    <v-chip v-for="item in categoryArticleList" :key="item.id" 
                    class="mb-2 badge badge-warning mr-2"  @click="gotoCategoryBlog(item.slug)"
                        style="cursor: pointer;">
                        {{item.nom}}
                    </v-chip>

                    <v-divider></v-divider>

                    

                </div>

                <div class="col-md-12">
                    <iframe
                       
                        src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fweb.facebook.com%2Fdreamofdrc%3F_rdc%3D1%26_rdr&tabs=timeline&width=340&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId=1153717905395954"
                        width="340" height="500" style="width: 100%;border:none;overflow:hidden" scrolling="no" frameborder="0"
                        allowfullscreen="true"
                        allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>

                    <br>
                </div>

                <v-divider></v-divider>

                <div class="col-md-12">
                    Suivez nous sur 
                    <v-btn icon color="primary" @click="gottoPage(sitInfoList.facebook)">
                        <v-icon>fa-facebook</v-icon>
                    </v-btn>

                    <v-btn icon color="info" @click="gottoPage(sitInfoList.linkedin)">
                        <v-icon>fa-linkedin</v-icon>
                    </v-btn>

                    <v-btn icon color="primary" @click="gottoPage(sitInfoList.twitter)">
                        <v-icon>fa-twitter</v-icon>
                    </v-btn>

                    <v-btn icon color="primary">
                        <v-icon>fa-youtube</v-icon>
                    </v-btn>
                </div>


                            
                        
            </v-flex>


           


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
        }
    },
    computed: {
      ...mapGetters(["basicInfoList","sitInfoList","categoryArticleList","CategorySlug", "isloading"]),
    },
    methods:{
        ...mapActions(["getInfoBasic","getInfoSite","getCategyArticle", "CatgetSigleBLOGInfos"]),

        gottoPage(url)
        {
            
            if (url !='') {
                window.open(url);
            } else {
                
            }
            
        },

        gotoCategoryBlog(slug)
        {
            this.$router.push({ path: `/articleCategory/${slug}` });
            this.$store.dispatch("CatgetSigleBLOGInfos", slug);
        },

    },
    created(){

        this.getInfoSite();
        this.getInfoBasic();
        this.getCategyArticle();

    }
}
</script>

