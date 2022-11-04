<template>
<jet-authentication-card class="bg-blue-200">
        <div v-if="status" class="mb-4 font-medium text-sm text-green-600">
            {{ status }}
        </div>


        <div class="min-h-screen bg-gray-100 flex flex-col justify-center sm:py-12" style="margin-bottom: -120px; ">
        <div class="p-10 xs:p-0 mx-auto md:w-full md:max-w-md" style="margin-top: -90px; ">


              <figure class="pageLogo flex justify-center mt-8 mb-3">
                    <img :src="'/storage/images/bara-single.svg'" class="pageLogo__image" style="height:70px; margin-top:-40px;" alt="e-Ligtas Project">
                </figure>

          <div class="bg-white shadow w-full rounded-lg divide-y divide-gray-200">
            <form @submit.prevent="submit">
            <div class="px-5 py-7" >

              <label for="username" value="Username" class="font-semibold text-sm text-gray-600 pb-1 block">Username</label>
              <jet-input  id="username" type="text"  v-model="form.username" required autofocus class="border rounded-lg px-3 py-2 mt-1 mb-5 text-sm w-full" />

              <label for="password" value="Password" class="font-semibold text-sm text-gray-600 pb-1 block">Password</label>
              <jet-input id="password" type="password" class="border rounded-lg px-3 py-2 mt-1 mb-5 text-sm w-full" v-model="form.password" required autocomplete="current-password"/>

              <jet-button class="{ 'opacity-25': form.processing } transition duration-200 bg-blue-500 hover:bg-blue-600 focus:bg-blue-700 focus:shadow-sm focus:ring-4 focus:ring-blue-500 focus:ring-opacity-50 text-white w-full py-2.5 rounded-lg text-sm shadow-sm hover:shadow-md font-semibold text-center inline-block justify-center" :disabled="form.processing">
                  <span class="inline-block mr-2">Login</span>
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="w-4 h-4 inline-block">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3" />
                  </svg>
              </jet-button>
            </div>
            </form>
            <div class="py-5">
              <div class="grid grid-cols-2 gap-1">
                <div class="text-center sm:text-left whitespace-nowrap">
                  <inertia-link v-if="canResetPassword" :href="route('password.request')" class="transition duration-200 mx-5 px-5 py-4 cursor-pointer font-normal text-sm rounded-lg text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-200 focus:ring-2 focus:ring-gray-400 focus:ring-opacity-50 ring-inset">
                      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="w-4 h-4 inline-block align-text-top">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 11V7a4 4 0 118 0m-4 8v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2z" />
                      </svg>
                      <span class="inline-block ml-1">Forgot Password</span>
                  </inertia-link>
                </div>

              </div>
            </div>
          </div>
          <div class="py-5">
              <div class="grid grid-cols-2 gap-1">
                <div class="text-center sm:text-left whitespace-nowrap">
                  <inertia-link href="/" class="transition duration-200 mx-5 px-5 py-4 cursor-pointer font-normal text-sm rounded-lg text-gray-500 hover:bg-gray-200 focus:outline-none focus:bg-gray-300 focus:ring-2 focus:ring-gray-400 focus:ring-opacity-50 ring-inset">
                      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="w-4 h-4 inline-block align-text-top">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                      </svg>
                      <span class="inline-block ml-1">Back to e-Ligtas Welcome Page</span>
                  </inertia-link>
                </div>
              </div>
            </div>
        </div>
      </div>
       </jet-authentication-card>
</template>

<script>
    import JetAuthenticationCard from '@/Jetstream/AuthenticationCard'
    import JetAuthenticationCardLogo from '@/Jetstream/AuthenticationCardLogo'
    import JetButton from '@/Jetstream/Button'
    import JetInput from '@/Jetstream/Input'
    import JetCheckbox from '@/Jetstream/Checkbox'
    import JetLabel from '@/Jetstream/Label'
    import JetValidationErrors from '@/Jetstream/ValidationErrors'

    export default {
        components: {
            JetAuthenticationCard,
            JetAuthenticationCardLogo,
            JetButton,
            JetInput,
            JetCheckbox,
            JetLabel,
            JetValidationErrors
        },

        props: {
            canResetPassword: Boolean,
            status: String
        },

        data() {
            return {
                form: this.$inertia.form({
                    username: '',
                    password: '',
                    remember: false
                })
            }
        },

        methods: {
            submit() {
                this.form
                    .transform(data => ({
                        ... data,
                        remember: this.form.remember ? 'on' : ''
                    }))
                    .post(this.route('login'), {
                        onFinish: () => this.form.reset('password'),
                    })
            }
        }
    }
</script>
