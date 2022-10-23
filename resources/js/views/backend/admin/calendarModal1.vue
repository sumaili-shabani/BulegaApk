<template>
  <v-row justify="center">

      <v-layout row wrap>
          <v-flex xs12 sm12 lg12 md12>

              <v-card
                :disabled="loading"
                :loading="loading"
                style="background: #f8f9fa"
            >
                <v-form ref="form" lazy-validation autocomplete="off">
                <v-toolbar color="white" flat>
                    <v-btn icon>
                    <v-icon>today</v-icon>
                    </v-btn>
                    <v-toolbar-title style="color: #1976d2 !important"
                    ># {{ userData.name }}
                    </v-toolbar-title>
                    <v-spacer></v-spacer>

                    <v-tooltip bottom>
                    <template v-slot:activator="{ on, attrs }">
                        <span v-bind="attrs" v-on="on">
                        <v-btn @click="dialog = false" slot="btn" fab depressed text>
                            <v-icon>arrow_forward</v-icon>
                        </v-btn>
                        </span>
                    </template>

                    <span>Mon calendrier d'évenément</span>
                    </v-tooltip>
                </v-toolbar>

                <br />
                <v-layout>
                    <v-col cols="12">
                    <v-layout>
                        <v-flex md12>
                        <v-card>
                            <div>
                            <v-sheet tile height="54" class="d-flex">
                                <v-btn
                                color="primary"
                                icon
                                class="ma-2"
                                @click="$refs.calendar.prev()"
                                >
                                <v-icon>chevron_left</v-icon>
                                </v-btn>
                                <v-select
                                v-model="type"
                                :items="types"
                                dense
                                outlined
                                hide-details
                                class="ma-2"
                                label="Type"
                                ></v-select>
                                <v-select
                                v-model="mode"
                                :items="modes"
                                dense
                                outlined
                                hide-details
                                label="event-overlap-mode"
                                class="ma-2"
                                ></v-select>
                                <v-select
                                v-model="weekday"
                                :items="weekdays"
                                dense
                                outlined
                                hide-details
                                label="weekdays"
                                class="ma-2"
                                ></v-select>
                                <v-spacer></v-spacer>
                                <v-btn
                                color="primary"
                                icon
                                class="ma-2"
                                @click="$refs.calendar.next()"
                                >
                                <v-icon>navigate_next</v-icon>
                                </v-btn>
                            </v-sheet>
                            <v-sheet height="600">
                                <v-calendar
                                ref="calendar"
                                v-model="today"
                                :weekdays="weekday"
                                :type="type"
                                :events="events"
                                :event-overlap-mode="mode"
                                :event-overlap-threshold="30"
                                :event-color="generatecolor"
                                ></v-calendar>
                            </v-sheet>
                            </div>
                        </v-card>
                        <br /><br />

                        <!-- select user data  -->

                        <!-- end select user data  -->
                        </v-flex>
                    </v-layout>

                    <!-- selected users  -->
                    </v-col>
                </v-layout>

                <!-- users table  -->
                <!-- users table  -->
                </v-form>
            </v-card>
              
          </v-flex>
      </v-layout>
    
  </v-row>
</template>
<script>
export default {
  data() {
    return {
      // to continue on comment modal

      taskData: {
        task_id: "",
        task_name: "",
      },
      dialog: false,
      edit: false,
      loading: false,
      commentList: [],
      userName: "",

      disabledDialog: false,
      btnLoading: false,
      commentData: {
        project_id: "",
      },

      //calendar start here
      type: "month",
      types: ["month", "week", "day"],
      mode: "stack",
      modes: ["stack", "column"],
      weekday: [0, 1, 2, 3, 4, 5, 6],
      weekdays: [
        { text: "Dimanche - Samedi", value: [0, 1, 2, 3, 4, 5, 6] },
        { text: "Lundi - Dimanche", value: [1, 2, 3, 4, 5, 6, 0] },
        { text: "Lundi - Vendredi", value: [1, 2, 3, 4, 5] },
        { text: "Lundi, Mercredi, Vendredi", value: [1, 3, 5] },
      ],
      value: "",
      today: new Date().toISOString().substr(0, 10),
      events: [
        { name: "plan du projet ", start: "2022-04-02", end: "2022-04-03" },
      ],

      //calendar end here
    };
  },

  created(){
    this.display_calendar();
  },

  methods: {
    display_calendar() {
       var id = this.userData.id;
      this.editOrFetch(
        `${this.apiBaseURL}/displayInCalendar/${id}`
      ).then(({ data }) => (this.events = data.data));
    },
    generatecolor() {
      var array = [
        "blue",
        "indigo",
        "deep-purple",
        "cyan",
        "green",
        "orange",
        "grey darken-1",
      ];
      return array[Math.floor(Math.random() * array.length)];
    },
  },
};
</script>

<style scoped>
.my-event {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  border-radius: 2px;
  background-color: #1867c0;
  color: #ffffff;
  border: 1px solid #1867c0;
  font-size: 12px;
  padding: 3px;
  cursor: pointer;
  margin-bottom: 1px;
  left: 4px;
  margin-right: 8px;
  position: relative;
}

.my-event.with-time {
  position: absolute;
  right: 4px;
  margin-right: 0px;
}
</style>
