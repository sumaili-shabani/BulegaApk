<template>
  <v-card>
    
    <v-tabs orizontal>

     
      <v-tab>
        <v-icon left> mdi-access-point </v-icon>
        Informations basiques
      </v-tab>

      <v-tab active>
        <v-icon left> satellite </v-icon>
        Autres informations
      </v-tab>

      <v-tab>
        <v-icon left> satellite </v-icon>
        Mon Avatar
      </v-tab>


     
     

      <!-- item 3 -->
      <v-tab-item>
        <v-card flat>
          <v-card-text>
            <Basic />
          </v-card-text>
        </v-card>
      </v-tab-item>
      <!-- fin -->

      <!-- item 2 -->
      <v-tab-item>
        <v-card flat>
          <v-card-text>
            <basicAutre />
          </v-card-text>
        </v-card>
      </v-tab-item>
      <!-- fin -->

      <!-- item 3 -->
      <v-tab-item>
        <v-card flat>
          <v-card-text>
            <BasicAvatar />
          </v-card-text>
        </v-card>
      </v-tab-item>
      <!-- fin -->
    </v-tabs>
  </v-card>
</template>

<script>
import Basic from "./basic.vue";
import ProfileConnected from "./profileConnected.vue";
import BasicAvatar from "./basicAvatar.vue";
import basicAutre from './basicAutre.vue';

export default {
  components: {
    Basic,
    ProfileConnected,
    BasicAvatar,
    basicAutre,
  },
  data() {
    return {
      title: "Profil",

    };
  },
  methods: {},
};
</script>