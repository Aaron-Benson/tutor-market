<template>
  <div>
    <div class="row" v-for="account in list">
      <div class="col-lg-3 col-sm-5">
        <user-card fullname="Aaron Benson"
                    rating=3.5
                    description="Hey I am very good at teaching math as well as some other subjects feel free to come at me."
                    confirmedAppointments=4
                    reviews=4>

      </user-card>
      </div>

      <div class="col-lg-3 col-sm-5">
        <user-card>

      </user-card>
      </div>
      <div class="col-lg-3 col-sm-5">
        <user-card>

      </user-card>
      </div>
      <div class="col-lg-3 col-sm-5">
        <user-card>

      </user-card>
      </div>
    </div>
    <infinite-loading @infinite="infiniteHandler"></infinite-loading>

  </div>
</template>
<script>
  import CircleChartCard from 'src/components/UIComponents/Cards/UserAccountCard.vue'
  import StatsCard from 'src/components/UIComponents/Cards/StatsCard.vue'
  import ChartCard from 'src/components/UIComponents/Cards/ChartCard.vue'
  import Loading from 'src/components/Dashboard/Layout/LoadingMainPanel.vue'
  import InfiniteLoading from 'vue-infinite-loading'
  import UserCard from './../Pages/UserProfile/CustomUserCard.vue'

  const WorldMap = () => ({
    component: import('./../Maps/WorldMap.vue'),
    loading: Loading,
    delay: 200
  })

  export default {
    components: {
      StatsCard,
      ChartCard,
      InfiniteLoading,
      CircleChartCard,
      UserCard,
    },
    /**
     * Chart data used to render stats, charts. Should be replaced with server data
     */
    data () {
      return {
        list: [],
      }
    },
    methods: {
      infiniteHandler($state) {
        setTimeout(() => {
          const temp = [];
          for (let i = this.list.length + 1; i <= this.list.length + 2; i++) {
            temp.push(i);
          }
          this.list = this.list.concat(temp);
          $state.loaded();
        }, 1000);
      },
    }
  }

</script>
<style>

</style>
