<template>
    <div>
        <v-col lg="12" cols="12" xs="12">
            <v-form>
                <v-text-field
                class="p-0 m-0 mt-0"
                full-width
                dense
                append-icon="mdi-magnify"
                outlined
                rounded
                placeholder="Recherche..."

                v-model="query"
                @keyup="searchMember"
                clearable
                
                />
            </v-form>  
        </v-col>

        <v-divider></v-divider>
          
        <v-list>
            <div class="text-center">
               <strong> Nos recentes Publications</strong>
            </div>
            <!-- debit -->
            <v-list-item v-for="item in fetchData" :key="item.id"
            >
                <v-list-item-avatar>
                    <img
                        style="border-radius: 50px; width: 50px; height: 50px"
                        :src="
                        item.photo == null
                            ? `${baseURL}/article/vuetify.png`
                            : `${baseURL}/article/` + item.photo
                        "
                    />
                </v-list-item-avatar>

                <v-list-item-content>
                    <v-list-item-title>{{ item.titre | subStrLong2 }}</v-list-item-title>
                    <v-list-item-subtitle>
                        <span class="text--primary"></span>  
                        {{ item.created_at | formatDate }}
                        {{ item.created_at | formatHour }}
                    </v-list-item-subtitle>
                    
                </v-list-item-content>
                <v-list-tile-action>
                    <v-spacer></v-spacer>

                        <v-btn text  @click="gotoBlog(item.slug)">
                            <v-icon>mdi-eye</v-icon> lire 
                        </v-btn>
                </v-list-tile-action>
            </v-list-item>
            <!-- fin -->
            <v-divider></v-divider>

            <v-pagination
                color="primary"
                v-model="pagination.current"
                :length="pagination.total"
                :total-visible="0"
                @input="onPageChange"
            ></v-pagination>

            



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
            fetchData:null,
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
            this.fetch_data(`${this.apiBaseURL}/fetch_blog_menu?page=`);
        },

        gotoBlog(slug)
        {
            this.$router.push({ path: `/article/${slug}` });
            this.$store.dispatch("getSigleBLOGInfos", slug);
        },

    },
    created(){
        this.onPageChange();
        
    }
}
</script>

