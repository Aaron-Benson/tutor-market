<template>
  <div>
    <h5 class="text-center">Log into Facebook and we'll do the rest.</h5>
    <div class="row">
      <div class="col-md-10 col-md-offset-1" id="wrapper">


          <button v-on:click="checkLoginState()" class="btn btn-info btn-fill btn-wd">Continue with Facebook</button>
      </div>
    </div>
  </div>
</template>
<script>
  import {mapFields} from 'vee-validate'
  import swal from 'sweetalert2'

  
  export default {
    computed: {
      ...mapFields(['firstName', 'lastName', 'id'])
    },
    data () {
      return {
        model: {
          firstName: '',
          lastName: '',
          id: ''
        },
        modelValidations: {
          id: {
          },
          firstName: {
          },
          lastName: {
          }
        }
      }
    },
    methods: {
      getError (fieldName) {
        return this.errors.first(fieldName)
      },
      validate () {
        return this.$validator.validateAll()
      },
      checkLoginState: function() {
        var this_ref = this
        FB.login(function(response) {
          if (response.authResponse) {
            FB.api('/me', function(response) {
              var nameArr = response.name.split(/[ ,]+/)
              this_ref.model.firstName = nameArr[0]
              this_ref.model.lastName = nameArr[nameArr.length - 1]
              this_ref.model.id = response.id
              //swal(this_ref.model.lastName)
              document.getElementById("nextButton").click()
            });
          } else {
            swal({
                title: 'Facebook Login Failed',
                text: 'We were unable to connect to your Facebook account. Please try again.',
                type: 'error',
                confirmButtonClass: 'btn btn-info btn-fill',
                buttonsStyling: false
              })
          }
        });
      }
    }
  }
</script>
<style>
#wrapper {
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>
