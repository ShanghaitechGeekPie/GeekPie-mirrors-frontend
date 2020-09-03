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
    </div>
  </div>
</template>

<script>
const axios = require('axios');
export default {
  name: "sidebar",
  data (){
    this.otherlinks= [
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
      this.repotable = res.data;
      this.$forceUpdate();
    })
  },
};
</script>
