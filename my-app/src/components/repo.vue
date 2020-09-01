<template>
  <v-simple-table fixed-header>
    <thead>
    <tr>
      <th class="text-left">Name</th>
      <th class="text-left">Last Update</th>
      <th class="text-left">Status</th>
      <th class="text-left">Help</th>

    </tr>
    </thead>
    <tbody>
    <tr v-for="item in repotable" :key="item.name">
      <td><a :href=local_url+item.name>{{ item.name }}</a></td>
      <td>{{ item.time }}</td>
      <td>{{ item.statuscode }}</td>
      <td>
        <v-btn :href=help_url+item.name+html_url>help</v-btn>
      </td>
    </tr>
    </tbody>
  </v-simple-table>
</template>

<script>
const axios = require('axios');
axios.defaults.retry = 999;
axios.defaults.retryDelay = 1;

export default {
  name: "repo",
  data() {
    this.local_url = "./";
    this.help_url = "https://mirrors.geekpie.club/help/";
    this.html_url = ".html";
    this.repotable = [];
    axios.request({
      url: "Mirrors-Status.json",
      method: 'get',
    }).then(res => {
      this.repotable = res.data;
      this.$forceUpdate();
      global.console.log(this.repotable)
    })
    this.time_now = Date.now() / 1000;
  }
}
</script>

<style scoped>

</style>