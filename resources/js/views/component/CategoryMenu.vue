<template>
    <div>
        <v-list>
            <v-list-item-content class="text-center">
                <v-list-item-title>Les categories</v-list-item-title>
               
                    Explorez nos catégories d'articles
            </v-list-item-content>
        </v-list>
        <v-divider></v-divider>
        <v-list>
          <v-list-item v-for="item in categoryArticleList" :key="item.id" @click="gotoCategoryBlog(item.slug)">
            <v-list-item-title>{{item.nom}}</v-list-item-title>
          </v-list-item>

        </v-list>
       
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
        ...mapActions(["getInfoBasic","getInfoSite","getCategyArticle","CatgetSigleBLOGInfos"]),

        gotoCategoryBlog(slug)
        {
            // alert("slug:"+slug);
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

