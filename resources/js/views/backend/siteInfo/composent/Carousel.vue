<template>
  <div class="col-md-12">
    <v-carousel cycle hide-delimiters>
      <v-carousel-item
        v-for="(item,i) in fetchData"
        :key="i"
        :src="
          item.photo == null
            ? `${baseURL}/fichier/avatar.png`
            : `${baseURL}/fichier/` + item.photo
        "
        reverse-transition="fade-transition"
        transition="fade-transition"
      >
        <v-row  class="title fill-height hidden-xs-only text-center" align="center" justify="center">
            <v-col md="12" sm="12" lg="12" >
                <div class="text-h5 white--text">
                  {{ item.description  }} <br>
                </div>
            </v-col>
           
        </v-row>
      </v-carousel-item>
    </v-carousel>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
export default {
  name: "Carousel",
  data(){
    return{
        titre: "",
        query:"",
        fetchData: null,
        
        items: [
            {
                src: "2.jpg",
                title: "Nous amenons les entreprises à aller au-delà de leurs limites"
            },
            {
                src: "1.jpg",
                title: "« Partenaire des entrepreneurs en RDC, le Hub Un Jour Nouveau propose une offre complète. Quelle que soit la situation de l'entrepreneur ou du projet, il y a une offre adaptée.. »."
            },
            {
                src: "3.jpg",
                title: "Nous amenons les entreprises à aller au-delà de leurs limites"
            },
            {
                src: "4.jpg",
                title: "« Partenaire des entrepreneurs en RDC, le Hub Un Jour Nouveau propose une offre complète. Quelle que soit la situation de l'entrepreneur ou du projet, il y a une offre adaptée.. »."
            },
           
        ]
    }
  },
  computed: {
    ...mapGetters(["sitInfoList", "isloading"]),
  },
  methods:{
    ...mapActions(["getInfoSite"]),

    onPageChange() {
        this.fetch_data(`${this.apiBaseURL}/fetch_carousel?page=`);
    },

    redirect(url){
        window.open(url);

    }

  },
  created(){
    this.getInfoSite();
    this.onPageChange();
  },

};
</script>