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

    <v-sheet
      id="scrolling-techniques"
      class="main-container"
      style="max-height: calc(100vh - 64px);"
    >
      <v-container>
        <v-main>
          <v-row>
            <v-col
                    class="d-flex"
                    cols="9">
              <HelloWorld/>

            </v-col>
            <v-col
                    class="d-flex"
                    cols="3">
              <sidebar />
            </v-col>
          </v-row>
        </v-main>
      </v-container>
    </v-sheet>
    <!-- <v-footer color="indigo">
      <span class="white--text">Geek Pie Association &copy; {{ new Date().getFullYear() }}</span>
    </v-footer>-->
  </v-app>
</template>

<script>
// import HelloWorld from './components/HelloWorld';
// import news from './components/news';
import sidebar from "./components/sidebar";
export default {
  name: "App",

  components: {
    sidebar,
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
