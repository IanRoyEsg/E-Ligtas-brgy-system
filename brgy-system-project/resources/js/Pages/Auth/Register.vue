<template>
    <jet-authentication-card class="bg-blue-200">
        <figure class="pageLogo flex justify-center mt-8 mb-3">
            <img :src="'/storage/images/reg-ic.svg'" class="pageLogo__image" style="height:70px; margin-top:-20px;" alt="e-Ligtas Project">
        </figure>

        <jet-validation-errors class="mb-4" />

        <form @submit.prevent="submit">
            <div>
                <jet-label for="firstname" value="First Name" />
                <jet-input id="firstname" type="text" class="mt-1 block w-full bg-blue-100" v-model="form.firstname" required autofocus autocomplete="firstname" />
            </div>
            <div class="mt-2">
                <jet-label for="lastname" value="Last Name" />
                <jet-input id="lastname" type="text" class="mt-1 block w-full bg-blue-100" v-model="form.lastname" required autofocus autocomplete="lastname" />
            </div>
            <div class="mt-2">
                <jet-label for="username" value="Username" />
                <jet-input id="username" type="text" class="mt-1 block w-full bg-blue-100" v-model="form.username" required autofocus autocomplete="username" />
            </div>

            <div class="mt-2">
                <jet-label for="email" value="Email" />
                <jet-input id="email" type="email" class="mt-1 block w-full bg-blue-100" v-model="form.email" required />
            </div>

            <div class="mt-2">
                <jet-label for="password" value="Password" />
                <jet-input id="password" type="password" class="mt-1 block w-full bg-blue-100" v-model="form.password" required autocomplete="new-password" />
            </div>

            <div class="mt-2">
                <jet-label for="password_confirmation" value="Confirm Password" />
                <jet-input id="password_confirmation" type="password" class="mt-1 block w-full bg-blue-100" v-model="form.password_confirmation" required autocomplete="new-password" />
            </div>

            <div class="mt-2" v-if="$page.props.jetstream.hasTermsAndPrivacyPolicyFeature">
                <jet-label for="terms">
                    <div class="flex items-center">
                        <jet-checkbox name="terms" id="terms" v-model:checked="form.terms" />

                        <div class="ml-2">
                            I agree to the <a target="_blank" :href="route('terms.show')" class="underline text-sm text-gray-600 hover:text-gray-900">Terms of Service</a> and <a target="_blank" :href="route('policy.show')" class="underline text-sm text-gray-600 hover:text-gray-900">Privacy Policy</a>
                        </div>
                    </div>
                </jet-label>
            </div>

            <div class="flex items-center justify-end mt-4">
                <inertia-link :href="route('login')" class="underline text-sm text-gray-600 hover:text-gray-900">
                    Already registered?
                </inertia-link>

                <jet-button class="ml-4 transition duration-200 bg-blue-500 hover:bg-blue-600 focus:bg-blue-700 focus:shadow-sm focus:ring-4 focus:ring-blue-500 focus:ring-opacity-50 text-white  py-2.5 rounded-lg text-sm shadow-sm hover:shadow-md font-semibold text-center inline-block justify-center" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                    Register
                </jet-button>
            </div>
        </form>
    </jet-authentication-card>
</template>

<script>
    import JetAuthenticationCard from '@/Jetstream/AuthenticationCard'
    import JetAuthenticationCardLogo from '@/Jetstream/AuthenticationCardLogo'
    import JetButton from '@/Jetstream/Button'
    import JetInput from '@/Jetstream/Input'
    import JetCheckbox from "@/Jetstream/Checkbox";
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

        data() {
            return {
                form: this.$inertia.form({
                    firstname: '',
                    lastname: '',
                    username: '',
                    email: '',
                    password: '',
                    password_confirmation: '',
                    terms: false,
                })
            }
        },

        methods: {
            submit() {
                this.form.post(this.route('register'), {
                    onFinish: () => this.form.reset('password', 'password_confirmation'),
                })
            }
        }
    }
</script>
