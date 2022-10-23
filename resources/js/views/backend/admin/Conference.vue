<template>
    <v-card>
      
        <v-tabs orizontal>
          <v-tab>
            <v-icon left> mdi-bel </v-icon>
             Calendrier d'évenement
           
          </v-tab>
  
          
  
          <v-tab>
            <v-icon left> mdi-bel </v-icon>
            Notification des Conférence
            
          </v-tab>
  
          
  
          <!--item 1  -->
          <v-tab-item>
            <v-card flat>
              <v-card-text>
  
                <calendarModal />
              </v-card-text>
            </v-card>
          </v-tab-item>
          <!-- fin item 1 -->
  
         
  
           <!--item 4  -->
          <v-tab-item>
            <v-card flat>
              <v-card-text>
  
               
                <EventNotification />
  
  
              </v-card-text>
            </v-card>
          </v-tab-item>
          <!-- fin item 4 -->
  
         
  
        </v-tabs>
    </v-card>
  </template>
  
  <script>

  import calendarModal from "./calendarModal1.vue";
  import EventNotification from './EventNotification.vue';


  export default {
    components: {
     
      calendarModal,
      EventNotification,

    },
    data() {
      return {
        title: "Notifications",
        svData: {
          countBell: "",
          countPayement:"",
          carCount:"",
        },
        dialog: false,
        loading: false,
        disabled: false,
  
        fav: false,
      };
    },
    created() {
    //   this.showCountNotification();
    },
    methods: {
      showCountNotification() {
        var id_user = this.userData.id;
        this.editOrFetch(
          `${this.apiBaseURL}/showCountNotionByUser/${id_user}`
        ).then(({ data }) => {
          var donnees = data.data;
  
          this.getSvData(this.svData, data.data[0]);
        });
      }
    }
  };
  </script>