<template>
    <div>
        <vue-jitsi-meet ref="jitsiRef" domain="meet.jit.si" style="height: 500px;" :options="jitsiOptions"></vue-jitsi-meet>
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
        ...mapGetters(["basicInfoList", "sitInfoList", "categoryArticleList", "isloading"]),
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
        ...mapActions(["getInfoBasic", "getInfoSite", "getCategyArticle"]),
        onIFrameLoad() {
            // do stuff
        },


    },
    created() {

        // this.getInfoSite();
        // this.getInfoBasic();
        // this.getCategyArticle();

    }
}
</script>
