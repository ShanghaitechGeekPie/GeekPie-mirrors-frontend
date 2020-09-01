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
      <td>{{ getUpdateTime(Math.floor(item.time*1000)) }}</td>
      <td>
        <div v-if="item.statuscode < 0">
          <v-progress-circular
              indeterminate
              color="yellow"
          >U
          </v-progress-circular>
        </div>
        <div v-else-if="item.statuscode !== 0">
          <v-progress-circular
              indeterminate
              color="primary"
          >L
          </v-progress-circular>
        </div>
        <div v-else>
          <v-progress-circular
              :value="100"
              color="green"
          >G
          </v-progress-circular>
        </div>
      </td>
      <td>
        <v-btn :href=help_url+item.name+html_url color="primary">help</v-btn>
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
    })
  },
  methods: {
    getUpdateTime: function(updateTime){
      if (updateTime === null) {
        return '';
      }
      let now = new Date().getTime()
      let second = Math.floor((now - updateTime) / (1000))
      let minute = Math.floor(second / 60)
      let hour = Math.floor(minute / 60)
      let day = Math.floor(hour / 24)
      let month = Math.floor(day / 31)
      let year = Math.floor(month / 12)
      if (year > 0) {
        return year + '年前';
      } else if (month > 0) {
        return month + '月前';
      } else if (day > 0) {
        let ret = day + '天前'
        if (day >= 7 && day < 14) {
          ret = '1周前'
        } else if (day >= 14 && day < 21) {
          ret = '2周前'
        } else if (day >= 21 && day < 28) {
          ret = '3周前'
        } else if (day >= 28 && day < 31) {
          ret = '4周前'
        }
        return ret;
      } else if (hour > 0) {
        return hour + '小时前';
      } else if (minute > 0) {
        return minute + '分钟前';
      } else if (second > 0) {
        return second + '秒前';
      } else {
        return '刚刚';
      }
    }
  }
}
</script>

<style scoped>

</style>