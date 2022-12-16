<template>
  <v-app id="inspire">

    <!-- <v-app-bar flat max-height="65" class="white">
      <Header />
    </v-app-bar> -->
    <!-- appbar -->
      <!-- appbar -->
      <v-app-bar clipped-left app flat elevation="1" >

        <!-- <v-icon large >home</v-icon> -->
        <img
          style="position: relative; top: 12px"
          width="90"
          :src="`${baseURL}/images/pnud.png`"
          alt=""
        />

      

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
          <v-icon>mail</v-icon> Qui sommes-nous ?
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
   
    <!-- fin apbar -->


    <v-main style="background: #f5f5f540">
      <v-container class="py-1 px-6" fluid>
        <router-view></router-view>
      </v-container>
    </v-main>

    <v-footer style="background: #f5f5f540">
      <FooterVue />
    </v-footer>
  </v-app>
</template>

<script>

// import '../../../js/scss/main.scss'

import { mapGetters, mapActions } from "vuex";
import NavMenu from "../../component/navMenu.vue";
import Navigation from "../../component/navigation.vue";

import AutreMenu from  "../../component/AutreMenu.vue";
import CategoryMenu from  "../../component/CategoryMenu.vue";
import FooterVue from "../../backend/siteInfo/Footer.vue";

export default {
  name: "App",
  components: {
    NavMenu,
    Navigation,
    AutreMenu,
    CategoryMenu,
    FooterVue,
  },
  data() {
    return {
      baseURL: "",
      drawer: true,
      loading: false,

      themeIcon: "dark_mode",
      lightBg: "background: rgb(246 248 250)",
      darkBg: "background:rgb(40, 42, 54)",

      search:false,
      menu: false,


    }

  },
  computed: {
    ...mapGetters(["userList", "isloading"]),
  },
  methods: {
    ...mapActions(["getUser"]),
    redirect(){
        window.open(`${this.baseURL}/logout`);
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

  },
  created() {

  }

};
</script>