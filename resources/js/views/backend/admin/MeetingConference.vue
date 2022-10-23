<template>
    <div>
        
       
        <v-layout row wrap>
            <v-flex xs12 sm12 md12 lg12 v-for="item in MeetingSlug" :key="item.id">
                <div class="mr-1">
                    <vue-jitsi-meet  ref="jitsiRef" domain="meet.jit.si" style="height: 500px;" :options="jitsiOptions"></vue-jitsi-meet>
                </div>
            </v-flex>
        </v-layout>

        
    </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import { JitsiMeet } from '@mycure/vue-jitsi-meet';

export default {
    components: {
        VueJitsiMeet: JitsiMeet
    },
    data() {
        return {
            title: "Map google",
            query: "",
            dialog: false,
            loading: false,
            disabled: false,
            edit: false,

            roomName: 'victory-some-room-name',

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
        ...mapGetters(["basicInfoList", "sitInfoList", "categoryArticleList","MeetingSlug", "isloading"]),
        jitsiOptions() {
            return {
                roomName: this.roomName,
                noSSL: false,
                userInfo: {
                    email: this.userData.email,
                    displayName: this.userData.name,
                },
                configOverwrite: {
                    enableNoisyMicDetection: false
                },
                interfaceConfigOverwrite: {
                    SHOW_JITSI_WATERMARK: false,
                    SHOW_WATERMARK_FOR_GUESTS: false,
                    SHOW_CHROME_EXTENSION_BANNER: false
                },
                onload: this.onIFrameLoad
            };
        },
    },
    methods: {
        ...mapActions(["getInfoBasic", "getInfoSite","getMeetingSlug", "getCategyArticle"]),
        onIFrameLoad() {
            // do stuff
        },

        changeRoolName(slug)
        {
            if (slug != '' ) {
                this.roomName = this.$route.params.slug;
            } else {
                this.roomName = this.MeetingSlug[0].slug;
            }
            
        }


    },
    created() {
        this.$store.dispatch("getMeetingSlug", this.$route.params.slug);
        this.changeRoolName();

    }
}
</script>
