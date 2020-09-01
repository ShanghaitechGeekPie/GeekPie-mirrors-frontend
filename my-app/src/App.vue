<template>
  <v-app class="overflow-hidden">
    <v-app-bar
      app
      fixed
      color="#fcb69f"
      dark
      shrink-on-scroll
      src="https://picsum.photos/1920/1080?random"
      height="200"
    >
      <div class="d-flex align-center">
        <v-img
          alt="Logo"
          class="shrink mr-2"
          contain
          src="logo.png"
          transition="scale-transition"
          height="50"
        />
      </div>
      <v-toolbar-title style="font-size: 125%">GeekPie Open Source Mirror</v-toolbar-title>
    </v-app-bar>

    <!---
    <v-sheet
      id="scrolling-techniques"
      class="main-container"
      style="max-height: calc(100vh - 64px);"
    >
    --->

    <v-main>
      <v-container>
        <v-row>
          <v-col cols="9">
            <repo />
          </v-col>
          <v-col cols="3">
            <sidebar />
          </v-col>
        </v-row>
      </v-container>
    </v-main>

    <!---
    </v-sheet>
    --->
    <v-footer color="indigo">
      <span class="white--text">Geek Pie Association &copy; {{ new Date().getFullYear() }}</span>
    </v-footer>
  </v-app>
</template>

<script>
import sidebar from "./components/sidebar";
import repo from "./components/repo";
export default {
  name: "App",

  components: {
    sidebar,
    repo,
  },

  data: () => ({
    windowHeight: document.documentElement.clientHeight - 1000,
  }),

  computed: {
    scrollerHeight: function () {
      return window.innerHeight * 0.9;
    },
  },
};
</script>
