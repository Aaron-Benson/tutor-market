<template>
  <div class="card card-user">
    <div class="image">
      <img src="static/img/background.jpg" alt="...">
    </div>
    <div class="card-content">
      <div class="author">
        <img class="avatar border-white" src="static/img/faces/face-2.jpg" alt="...">
        <h4 class="title">{{fullname}}
          <br>
          <star-rating id="star-rating"
            v-bind:increment="0.5"
            v-bind:max-rating="5"
            v-bind:rating="rating"
            v-bind:read-only=true
            v-bind:star-size="20"
            v-bind:show-rating=false
          ></star-rating>
        </h4>
      </div>
      <p class="description text-center">{{description}}
      </p>
    </div>
  </div>
</template>
<script>
  import StarRating from 'vue-star-rating'

  export default {

    components: {
      StarRating
    },

    props: {
      description: {
        type: String,
        default: ""
      },
      fullname: String,
      rating: {
        type: Number,
        default: 0
      },
      reviews: {
        type: Number,
        default: 0
      },
      confirmedAppointments: {
        type: Number,
        default: 0
      },
    },
    data () {
      return {
        details: [
          {
            title: '12',
            subTitle: 'Files'
          },
          {
            title: '2GB',
            subTitle: 'Used'
          },
          {
            title: '24,6$',
            subTitle: 'Spent'
          }
        ]
      }
    },
    methods: {
      getClasses (index) {
        const remainder = index % 3
        if (remainder === 0) {
          return 'col-md-3 col-md-offset-1'
        } else if (remainder === 2) {
          return 'col-md-4'
        } else {
          return 'col-md-3'
        }
      }
    }
  }

</script>
<style>

</style>
