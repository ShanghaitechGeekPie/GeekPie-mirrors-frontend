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
              <br />all systems green
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
              <br />
              <a href="https://mirrors-lan.geekpie.club">mirrors-lan.geekpie.club</a> 校内
              <br />
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
          <br />
        </v-card>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "test",
};
</script>
