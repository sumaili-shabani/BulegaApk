<template>
  <v-app id="inspire">
    <!-- navigation -->
    <v-navigation-drawer v-if="userData.id_role != null"  v-model="drawer"  app  clipped > 

      <v-list dense shaped>
        <v-subheader>Menu</v-subheader>
      </v-list>
      <!-- navigation -->
      <Navigation :linkAdmin="linkAdmin" />
      <!-- fin navigation -->
    </v-navigation-drawer>
    <!-- fin navigation -->

    <!-- appbar -->
    <v-app-bar clipped-left app flat elevation="1" >

       <!-- <v-icon large >home</v-icon> -->
       <img
          style="position: relative; top: 1px; border-radius: 100%;"
          width="80"
          :src="`${baseURL}/images/pnud.jpeg`"
          alt=""
        />

      <v-app-bar-nav-icon @click="changeDrawer" v-if="userData.id_role != null"> </v-app-bar-nav-icon>

      <v-col lg="4" cols="4" xs="4" v-show="search">
        <v-form>
          <v-text-field
            class="p-0 m-0 mt-6"
            full-width
            dense
            append-icon="mdi-magnify"
            outlined
            rounded
            placeholder="Search"
          />
        </v-form>  
      </v-col>

      
      <v-spacer />

       
      <v-spacer />

       
      
      <v-spacer />

      <div class="d-none d-sm-flex">
        <v-btn router to="/about" text>
          <v-icon>info</v-icon> Qui sommes-nous ?
        </v-btn>


        <v-btn text router to="/teamMember">
          <v-icon>person</v-icon> Groupe
        </v-btn>

        <v-btn text router to="/contact">
          <v-icon>mail</v-icon> Contact
        </v-btn>

      </div>

       
      <v-btn icon router to="/">
          <v-icon>mdi-home</v-icon> 
        
      </v-btn>

      <v-menu
        v-model="menu"
        :close-on-content-click="false"
        :nudge-width="200"
        offset-x
      >
        <template  v-slot:activator="{ on, attrs }" >
          <v-btn
            icon
            v-bind="attrs"
            v-on="on"
          >
              <v-icon>install_desktop</v-icon>
          </v-btn>
          
        </template>
        

        <!-- import menuActualite -->
        <v-card>
         <AutreMenu />
        </v-card>
        <!-- fin import menu -->

      </v-menu>


      <v-btn icon @click="search = !search">
        <v-icon>mdi-magnify</v-icon>
      </v-btn>


      <v-menu

        open-on-hover
        bottom
        offset-y
        
        right
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            icon
            
            v-bind="attrs"
            v-on="on"
          >
            <v-icon>mdi-dots-vertical</v-icon>
          </v-btn>
        </template>

        <!-- categories -->
        <CategoryMenu />
        <!-- fin categories  -->

       
      </v-menu>



      <!-- notification -->
      <v-btn @click="changeTheme" small fab depressed class="mr-2">
          <v-icon>{{ themeIcon }}</v-icon>
      </v-btn>
      <!-- <Notification /> -->
      <!-- fin notification -->

      <!-- navMenu avatar -->
      <NavMenu />
      <!-- fin navMenu avatar -->
      <v-progress-linear
        v-show="isloading"
        :indeterminate="isloading"
        absolute
        bottom
        color="primary"
      ></v-progress-linear>
    </v-app-bar>
    <!-- fin apbar -->

    <v-main id="bodyAll" >
      <v-container class="py-8 px-6" fluid>
        <router-view></router-view>
      </v-container>
    </v-main>

    <div v-if="userData.id == null">
      <v-footer style="background: #f5f5f540">
        <FooterVue />
      </v-footer>
    </div>
    


  </v-app>
</template>



<script>
import { mapGetters, mapActions } from "vuex";
import Navigation from "./views/component/navigation.vue";
import Notification from "./views/component/notification.vue";
import NavMenu from "./views/component/navMenu.vue";
import AutreMenu from  "./views/component/AutreMenu.vue";
import CategoryMenu from  "./views/component/CategoryMenu.vue";
import FooterVue from "./views/backend/siteInfo/Footer.vue";


export default {
  name: "App",
  components: {
    Navigation,
    Notification,
    NavMenu,
    AutreMenu,
    CategoryMenu,
    FooterVue,
  },
  data() {
    return {
      cards: ["Today", "Yesterday"],
      drawer: true,

      themeIcon: "dark_mode",
      lightBg: "background: rgb(246 248 250)",
      darkBg: "background:rgb(40, 42, 54)",

      linkAdmin: [],
      search:false,


      fav: true,
      menu: false,
      message: false,
      hints: true,





    };
  },
  created() {
    this.showConnected();
    this.testLink();
    this.testUser();
  },
  computed: {
    ...mapGetters(["userList", "isloading"]),
  },
  methods: {

    ...mapActions(["getUser"]),
    testUser()
    {
      if (this.userData.id != null) {
        this.drawer = true;
      } else {
        this.drawer = false;
      }
    },
    changeDrawer()
    {
        if (this.userData.id != null) {
          this.drawer = !this.drawer;
        } else {
          
        }
        
    },
    changeTheme() {
      this.$vuetify.theme.dark = !this.$vuetify.theme.dark;
      !this.$vuetify.theme.dark ? this.lightMode() : this.darkMode();
    },
    lightMode() {
      this.themeIcon = "dark_mode";
      this.$store.state.bgColor = this.lightBg;
    },
    darkMode() {
      this.themeIcon = "light_mode";
      this.$store.state.bgColor = this.darkBg;
    },

    showConnected() {
      var connected = this.userData.email;
      // console.log("user connected:" + connected);
    },
    testLink() {
      if (this.userData.id_role == 1) {
        this.linkAdmin = {
          links: [
            {
              icon: "mdi-microsoft-windows",
              text: "Tableau de bord",
              href: "/admin/dashboard",
            },

            {
              icon: "chat",
              text: "Chat",
              href: "/admin/chat",
            },
          ],

          links_operation_2: [
            {
              icon: "credit_card",
              text: "Carousel",
              href: "/admin/carousel",
            },
            {
              icon: "credit_card",
              text: "Service",
              href: "/admin/operation_service",
            },
            {
              icon: "store",
              text: "Galérie",
              href: "/admin/operation_galery",
            },
            {
              icon: "store",
              text: "Vidéo",
              href: "/admin/operation_video",
            },
            {
              icon: "store",
              text: "Partenaire",
              href: "/admin/operation_partenaire",
            },

            {
              icon: "store",
              text: "Notre famille",
              href: "/admin/operation_team",
            },
          ],

          links_operation: [
            // {
            //   icon: "store",
            //   text: "Pays",
            //   href: "/admin/pays",
            // },
            // {
            //   icon: "credit_card",
            //   text: "Provinces",
            //   href: "/admin/provinces",
            // },
            // {
            //   icon: "store",
            //   text: "Forme juridique",
            //   href: "/admin/forme_juridique",
            // },
            // {
            //     text: "Statistique sur les blogs",
            //     href: "/admin/statistique_entreprise",
            // },
            {
              icon: "store",
              text: "Territoire",
              href: "/admin/territoire",
            },

            {
              icon: "store",
              text: "Chefferie",
              href: "/admin/chefferie",
            },
            {
              icon: "store",
              text: "Groupement",
              href: "/admin/groupement",
            },
           
            {
              icon: "store",
              text: "Mot de la semaine",
              href: "/admin/week",
            },

            {
              icon: "store",
              text: "Envoie SMS",
              href: "/admin/texto",
            },
            {
              icon: "store",
              text: "Reunion",
              href: "/admin/reunion",
            },
            {
              icon: "store",
              text: "Conférence et calendrier",
              href: "/admin/calendrier",
            },
            {
              icon: "store",
              text: "Statistique sur Les utilisateur",
              href: "/admin/statistique_user",
            },

            
          ],

          links_systems: [
            {
              icon: "people",
              text: "Compte",
              href: "/admin/compte",
            },

            {
              icon: "api",
              text: "Privilège",
              href: "/admin/role",
            },
            {
              icon: "credit_card",
              text: "Contact pour info",
              href: "/admin/contact_info",
            },

            {
              icon: "api",
              text: "Configuration basique",
              href: "/admin/configure_basic",
            },

            {
              icon: "api",
              text: "Configuration du site",
              href: "/admin/configure_site",
            },

          ],

          sublinks: [
            {
              icon: "book",
              text: "A propos ",
              href: "/admin/about_page",
            },
          ],

          listGroup: [
            {
              text: "Articles",
              icon: "airplay",
              items: [
               
                {

                  text: "Catégorie d'article",
                  href: "/admin/operation_catArticle",
                },
                {
                  text: "Blog",
                  href: "/admin/operation_blog",
                },
                
              ],
            },
          ],

          admins: [
            ["Management", ""],
            ["Settings", ""],
          ],
        };
      } else if (this.userData.id_role == 2) {
        this.linkAdmin = {
          links: [
            {
              icon: "mdi-microsoft-windows",
              text: "Tableau de bord",
              href: "/user/dashboard",
            },

           {
              icon: "chat",
              text: "Chat",
              href: "/user/chat",
            },

            {
              icon: "person",
              text: "Mon profil",
              href: "/user/profil",
            },
          ],

          links_operation: [
            // {
            //   icon: "credit_card",
            //   text: "Mon entreprise",
            //   href: "/user/liste_entreprise",
            // },

            {
              icon: "store",
              text: "Conférence et calendrier",
              href: "/user/calendrier",
            },
            
          ],

          links_operation_2: [
            
          ],

          links_systems: [],

          sublinks: [
            {
              icon: "book",
              text: "A propos ",
              href: "/user/about_page",
            },
          ],

          listGroup: [
            {
              text: "Articles",
              icon: "airplay",
              items: [
               
                {
                  text: "Blog",
                  href: "/user/operation_blog",
                },
                
              ],
            },
          ],
        };
      } else if (this.userData.id_role == 3) {
        this.linkAdmin = {
          links: [
            {
              icon: "mdi-microsoft-windows",
              text: "Tableau de bord",
              href: "/member/dashboard",
            },

            {
              icon: "question_answer",
              text: "Messagerie",
              href: "/member/chat",
            },
          ],

          links_operation_2: [
            
          ],

          links_operation: [
            {
              icon: "store",
              text: "Conférence et calendrier",
              href: "/member/calendrier",
            },
          ],

          links_systems: [],

          sublinks: [
            {
              icon: "book",
              text: "A propos ",
              href: "/member/about_page",
            },
          ],

          listGroup: [
            {
              text: "Articles",
              icon: "airplay",
              items: [
               
                {
                  text: "Blog",
                  href: "/member/operation_blog",
                },
                
              ],
            },
          ],
        };
      } else {
      }
    },
  },
};
</script>

<style scoped>

  #inspire {
    /* background-image: url("./4.jpg"); */
    /* background: #f5f5f540; */
   
    width: 100%;
    /* height: 100vh; */
    height: 100%;
    background: linear-gradient(45deg, rgba(255, 243, 224,0.8), rgba(43, 39, 146, 0.8)), url(./5.jpg) center top no-repeat;
    background-size: cover;
    position: relative;
		    

			
  }

</style>



