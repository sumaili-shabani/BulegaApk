<template>
    <div>
        <v-layout row wrap>
            <v-flex xs12 sm12 md8 lg8>
                <div class="mr-1">


                    <!-- debit -->
                    <div class="text-justify">
                        
                        <div>

                            <div class="text-center">
                                <v-list-item>
                                    <v-list-item-content>
                                        <v-list-item-title>
                                            Contactez-nous pour information
                                            <p>
                                                Nous serons ravis de vous rencontrer et de répondre 
                                                à vos préoccupations.
                                            </p>

                                        </v-list-item-title>
                                       
                                    </v-list-item-content>
                                </v-list-item>
                            </div>

                            <v-container grid-list-xs> 

                                <v-layout row wrap>
                                    <v-flex xs12 sm12 md4 lg4>
                                        <div class="mr-1">

                                            <v-card>
                                                <v-card-text>
                                                    <v-list-item-title>Adresse email:</v-list-item-title>
                                                    <v-list-item-subtitle> {{sitInfoList.email}}</v-list-item-subtitle>
                                                </v-card-text>
                                            </v-card>


                                        </div>
                                        
                                    </v-flex>

                                    <v-flex xs12 sm12 md4 lg4>
                                        <div class="mr-1">

                                            <v-card>
                                                <v-card-text>
                                                    <v-list-item-title>Numéro de téléphone Principal:</v-list-item-title>
                                                    <v-list-item-subtitle> {{sitInfoList.tel1}}</v-list-item-subtitle>
                                                </v-card-text>
                                            </v-card>

                                        </div>
                                        
                                    </v-flex>

                                    <v-flex xs12 sm12 md4 lg4>
                                        <div class="mr-1">

                                            <v-card>
                                                <v-card-text>
                                                    <v-list-item-title>Adresse domicile:</v-list-item-title>
                                                    <v-list-item-subtitle> {{sitInfoList.adresse}}</v-list-item-subtitle>
                                                </v-card-text>
                                            </v-card>

                                        </div>
                                        
                                    </v-flex>
                                </v-layout>
                                
                            </v-container>

                           
                           
                            <v-container>
                                <v-form ref="form" lazy-validation>
                                   <v-card>
                                    <v-card-text>
                                        <v-layout row wrap>
                                            <v-flex xs12 sm12 md6 lg6>
                                                <div class="mr-1">
                                                    <v-text-field
                                                        label="Nom "
                                                        prepend-inner-icon="person"
                                                        :rules="[(v) => !!v || 'Ce champ est requis']"
                                                        outlined
                                                        v-model="svData.name"
                                                    ></v-text-field>
                                                </div>
                                            </v-flex>

                                            <v-flex xs12 sm12 md6 lg6>
                                                <div class="mr-1">
                                                    <v-text-field
                                                        label="Adresse mail "
                                                        prepend-inner-icon="mail"
                                                        :rules="[
                                                            (v) => !!v || 'Ce champ est requis',
                                                            (v) =>
                                                            /.+@.+\..+/.test(v) || 'L\'email doit être valide',
                                                        ]"
                                                        outlined
                                                        v-model="svData.email"
                                                    ></v-text-field>
                                                </div>
                                            </v-flex>

                                            <v-flex xs12 sm12 md6 lg6>
                                                <div class="mr-1">
                                                    <v-text-field
                                                        label="N° de Téléphone "
                                                        prepend-inner-icon="call"
                                                        :rules="[(v) => !!v || 'Ce champ est requis']"
                                                        outlined
                                                        v-model="svData.telephone"
                                                    ></v-text-field>
                                                </div>
                                            </v-flex>

                                            <v-flex xs12 sm12 md6 lg6>
                                                <div class="mr-1">
                                                    <v-text-field
                                                        label="Sujet "
                                                        prepend-inner-icon="drafts"
                                                        :rules="[(v) => !!v || 'Ce champ est requis']"
                                                        outlined
                                                        v-model="svData.subject"
                                                    ></v-text-field>
                                                </div>
                                            </v-flex>

                                            <v-flex xs12 sm12 md12 lg12>
                                                <div class="mr-1">
                                                    <v-textarea
                                                        label="Message"
                                                        rows="1"
                                                        prepend-inner-icon="inbox"
                                                        outlined
                                                        v-model="svData.message"
                                                        :rules="[(v) => !!v || 'Ce champ est requis']"

                                                        ></v-textarea> 
                                                </div>
                                            </v-flex>

                                            <v-flex xs12 sm12 md12 lg12>
                                                <div class="mr-1">
                                                    <v-btn
                                                        color="primary"
                                                        dark
                                                        :loading="loading"
                                                        @click="validate"
                                                        block
                                                    >
                                                        {{ edit ? "Modifier" : "Envoyer le message" }}
                                                    </v-btn>
                                                </div>
                                            </v-flex>



                                        </v-layout>
                                    </v-card-text>
                                   
                                   </v-card>
                                </v-form>
                            </v-container>
                            
                           <v-container grid-list-xs> 

                                <v-layout row wrap>
                                    <v-flex xs12 sm12 md12 lg12>

                                        <div class="mr-1">
                                            <div class="googlemap">
                                                <iframe 
                                                    src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15952.415313040445!2d29.2168952!3d-1.6797489!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x581b3fa6f38a8eac!2sUn%20Jour%20Nouveau%20Center!5e0!3m2!1sfr!2snl!4v1657724582555!5m2!1sfr!2snl" 
                                                    width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" 
                                                    referrerpolicy="no-referrer-when-downgrade">
                                                </iframe>
                                            </div>
                                        </div>
                                        
                                    </v-flex>
                                </v-layout>
                            
                           </v-container>
                           
                        </div>
                            
                    </div>
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

            svData: {
                id: "",
                name: "",
                email: "",
                telephone: "",
                subject: "",
                message: "",
            },
        }
    },
    computed: {
      ...mapGetters(["basicInfoList","sitInfoList","categoryArticleList", "isloading"]),
    },
    methods:{
        ...mapActions(["getInfoBasic","getInfoSite","getCategyArticle"]),

        validate() {
            if (this.$refs.form.validate()) {
            this.isLoading(true);
    
            this.insertOrUpdate(
                `${this.apiBaseURL}/insert_contact_onfo`,
                JSON.stringify(this.svData)
            )
                .then(({ data }) => {
                this.showMsg(data.data);
                this.isLoading(false);
                this.edit = false;
                this.resetObj(this.svData);
               
                })
                .catch((err) => {
                    this.svErr(), this.isLoading(false);
                });
            }
        },

    },
    created(){

        this.getInfoSite();
        this.getInfoBasic();
        this.getCategyArticle();

    }
}
</script>

