<template>
  <div>
    <h5 class="text-center">We just need a little more information about you.</h5>
    <div class="row">
      <div class="col-md-5 col-md-offset-1">
        <div class="form-group">
          <label class="control-label">
            First Name
          </label>
          <input id="firstNameID"
                 class="form-control"
                 type="text"
                 name="firstName"
                 data-vv-as="first name"
                 v-validate="modelValidations.firstName"
                 v-model="model.firstName"
                 placeholder="ex: Michael" 
          />
          <small class="text-danger" v-show="firstName.invalid">
            {{ getError('firstName') }}
          </small>
        </div>
      </div>
      <div class="col-md-5">
        <div class="form-group">
          <label class="control-label">
            Last Name
          </label>
          <input id="lastNameID"
                 class="form-control"
                 type="text"
                 name="lastName"
                 data-vv-as="last name"
                 v-validate="modelValidations.lastName"
                 v-model="model.lastName"
                 placeholder="ex: Knight" 
          />
          <small class="text-danger" v-show="lastName.invalid">
            {{ getError('lastName') }}
          </small>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-10 col-md-offset-1">
        <div class="form-group">
          <label class="control-label">
            Email
          </label>
          <input type="email"
                 name="email"
                 v-validate="modelValidations.email"
                 v-model="model.email"
                 class="form-control">
          <small class="text-danger" v-show="email.invalid">
            {{ getError('email') }}
          </small>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-5 col-md-offset-1">
        <div class="form-group">
          <label class="control-label">
            Password
          </label>
          <input class="form-control"
                 type="password"
                 name="password"
                 v-validate="modelValidations.password"
                 v-model="model.password"
          />
          <small class="text-danger" v-show="password.invalid">
            {{ getError('password') }}
          </small>
        </div>
      </div>
      <div class="col-md-5">
        <div class="form-group">
          <label class="control-label">
            Password (again)
          </label>
          <input class="form-control"
                 type="password"
                 name="passworda"
                 data-vv-as="password"
                 v-validate="'required|confirmed:password'"
                 v-model="model.passworda"
          />
          <small class="text-danger" v-show="passworda.invalid">
            {{ getError('passworda') }}
          </small>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  import {mapFields} from 'vee-validate'
  import swal from 'sweetalert2'

  export default {
    computed: {
      ...mapFields(['firstName', 'lastName', 'email', 'password', 'passworda'])
    },
    data () {
      return {
        firstModel: {},
        model: {
          firstName: '',
          lastName: '',
          email: '',
          password: '',
          passworda: '',
          description: ''
        },
        modelValidations: {
          firstName: {
            required: true
          },
          lastName: {
            required: true
          },
          email: {
            email: true,
            required: true
          },
          password: {
            required: true
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
      takeFirstModel(first) {
        this.firstModel = first
        document.getElementById("firstNameID").value = this.firstModel.firstName
        this.model.firstName = this.firstModel.firstName
        document.getElementById("lastNameID").value = this.firstModel.lastName
        this.model.lastName = this.firstModel.lastName
      }
    }
  }
</script>
<style>
</style>
