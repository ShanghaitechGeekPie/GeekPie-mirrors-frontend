<template>
  <div class="container">
    <div class="row">
      <div class="col col-12">
        <v-card class="mx-auto" max-width="344">
          <v-card-text>
            <p class="display-1 text--primary">镜像源状态</p>
            <!-- <p>adjective</p> -->
            <div class="text--primary">
              一切正常
              <br/>all systems green
            </div>
          </v-card-text>
          <!-- <v-card-actions>
                        <v-btn text color="deep-purple accent-4">Learn More</v-btn>
          </v-card-actions>-->
        </v-card>
      </div>

      <div class="col col-12">
        <v-card class="mx-auto" max-width="344">
          <v-card-text>
            <p class="display-1 text--primary">镜像源地址</p>
            <!-- <p>adjective</p> -->

            <div class="text--primary">
              <a href="https://mirrors.geekpie.club/">mirrors.geekpie.club</a> 自动切换
              <br/>
              <a href="https://mirrors-lan.geekpie.club">mirrors-lan.geekpie.club</a> 校内
              <br/>
              <a href="https://mirrors-wan.geekpie.club">mirrors-wan.geekpie.club</a> 校外
            </div>
          </v-card-text>
        </v-card>
      </div>

      <div class="col col-12">
        <v-card class="mx-auto" max-width="344">
          <v-card-text>
            <p class="display-1 text--primary">镜像源文档</p>
            <!-- <p>adjective</p> -->
            <div class="text--primary">如果您不了解如何配置和使用源， 这里为您提供了相关文档以供查阅：</div>
          </v-card-text>

          <div class="text-center">
            <v-btn rounded color="primary" href="https://mirrors.geekpie.club/help/" dark>镜像源文档</v-btn>
          </div>
          <br/>
        </v-card>
      </div>

      <div class="col col-12">
        <v-card class="mx-auto" max-width="344">
          <v-card-text>
            <p class="display-1 text--primary">其他链接</p>
          </v-card-text>
          <a
              v-for="(link, i) in otherlinks"
              :key="i"
              :href="link.href"
              class="subheading mx-3"
              target="_blank"
          >{{ link.text }}<br></a>

        </v-card>
      </div>
      <div class="col col-12">
        <v-card class="mx-auto" max-width="344">
          <div>

            <v-card-text>
              <v-progress-circular
                  indeterminate
                  color="primary"
              >L
              </v-progress-circular>
              ： 正在重试 Loading
            </v-card-text>
          </div>
          <div>

            <v-card-text>
              <v-progress-circular
                  indeterminate
                  color="yellow"
              >U
              </v-progress-circular>
              ： 正在同步 Updating
            </v-card-text>
          </div>

          <div>

            <v-card-text>
              <v-progress-circular
                  :value="100"
                  color="green"
              >G
              </v-progress-circular>
              ： 一切正常 Green
            </v-card-text>
          </div>

        </v-card>
      </div>
      <div  class="col col-12">
        <v-card class="mx-auto" max-width="344">
          <v-card-text><span :style="{'color':rgb}">同步状态（平均时间差）： {{getUpdateTime(alltime)}}</span></v-card-text>
        </v-card>
      </div>
    </div>
  </div>
</template>

<script>
const axios = require('axios');
export default {
  name: "sidebar",
  data() {
    this.otherlinks = [
      {
        text: "镜像源日志 / News",
        href: "https://t.me/GeekPie_mirrors",
      },
      {
        text: "新增镜像 / New Mirror",
        href: "https://github.com/ShanghaitechGeekPie/DailyWork/issues/4",
      },
      {
        text: "项目开源 / GitHub",
        href: "https://github.com/ShanghaitechGeekPie",
      },
      {
        text: "状态监控 / Status ",
        href: "https://status.geekpie.club/",
      },
      {
        text: "联系我们 / E-mail",
        href: "mailto://pie@geekpie.club",
      },
      {
        text: "ShanghaiTech University",
        href: "https://www.shanghaitech.edu.cn/",
      },
    ];
    axios.request({
      url: "Mirrors-Status.json",
      method: 'get',
    }).then(res => {
      this.alltime = 0;
      res.data.forEach((item)=>{this.alltime  += (new Date().getTime() - Math.floor(item.time * 1000));})
      this.alltime/=32;
      var percent = Math.log(21600)/Math.log(this.alltime);
      percent = Math.max(100,percent);
      percent = Math.min(0,percent);
      var r = percent<50 ? 255 : Math.floor(255-(percent*2-100)*255/100);
      var g = percent>50 ? 255 : Math.floor((percent*2)*255/100);
      this.rgb = 'rgb('+r+','+g+',0)';
      this.$forceUpdate();
    })
  },
  methods: {
    getUpdateTime: function(updateTime){
      if (updateTime === null) {
        return '';
      }
      let second = Math.floor((updateTime) / (1000))
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
};
</script>
