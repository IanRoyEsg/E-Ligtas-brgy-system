<template>
  <app-layout>
    <template #header>
      <h2 class="font-semibold text-xl text-gray-800 leading-tight">
        Edit Profile
      </h2>
    </template>

    <div class="py-12" style="margin-top: -35px;" >
      <div class="max-w-5xl mx-auto sm:px-6 lg:px-8 ">
        <jet-form-section @submitted="updateProfileInformation">
          <template #title> Profile Information </template>

          <template #description>
            Update your account's profile information.
          </template>

          <template #form >
            <!-- First Name -->
            <div class="col-span-6 sm:col-span-4">
              <jet-label for="firstname" value="First Name" />
              <jet-input
                id="firstname"
                type="text"
                class="mt-1 block w-full"
                v-model="form.firstname"
                autocomplete="firstname"
                style="background-color: rgba(191, 219, 254); width: 590px;"
              />
              <jet-input-error :message="form.errors.firstname" class="mt-2" />
            </div>
            <!-- Last Name -->
            <div class="col-span-6 sm:col-span-4">
              <jet-label for="lastname" value="Last Name" />
              <jet-input
                id="lastname"
                type="text"
                class="mt-1 block w-full"
                v-model="form.lastname"
                autocomplete="lastname"
                style="background-color: rgba(191, 219, 254); width: 590px;"
              />
              <jet-input-error :message="form.errors.lastname" class="mt-2" />
            </div>
            <!-- Username -->
            <div class="col-span-6 sm:col-span-4">
              <jet-label for="username" value="Username" />
              <jet-input
                id="username"
                type="text"
                class="mt-1 block w-full"
                v-model="form.username"
                autocomplete="username"
                style="background-color: rgba(191, 219, 254); width: 590px;"
              />
              <jet-input-error :message="form.errors.username" class="mt-2" />
            </div>

            <!-- Email -->
            <div class="col-span-6 sm:col-span-4">
              <jet-label for="email" value="Email" />
              <jet-input
                id="email"
                type="email"
                class="mt-1 block w-full"
                v-model="form.email"
                style="background-color: rgba(191, 219, 254); width: 590px;"
              />
              <jet-input-error :message="form.errors.email" class="mt-2" />
            </div>

            <!-- Role -->
            <div
              class="col-span-6 sm:col-span-4"
              v-if="$page.props.permission.users.editRole"
            >
              <jet-label for="role" value="Role" />
              <jet-select
                id="role"
                class="mt-1 block w-full"
                v-model="form.role"
                :options="roles"
                style="background-color: rgba(191, 219, 254); width: 590px;"
              />
              <jet-input-error :message="form.errors.role" class="mt-2" />
            </div>

<!-- save button -->
            <jet-action-message :on="form.recentlySuccessful" class="mr-3">
              Saved.
            </jet-action-message>


            <jet-button class="transition duration-200 bg-blue-500 hover:bg-blue-600 focus:bg-blue-700 focus:shadow-sm focus:ring-4 focus:ring-blue-500 focus:ring-opacity-50 text-white w-full py-2.5 rounded-lg text-sm shadow-sm hover:shadow-md font-semibold text-center inline-block justify-center"
              :class="{ 'opacity-25': form.processing }"
              :disabled="form.processing" style="height:45px; margin-top: 100px; margin-left: -320px;"
            >
              Save
            </jet-button>
<!-- save button -->
          </template>

        </jet-form-section>
      </div>
    </div>
  </app-layout>
</template>

<script>
import { useForm } from "@inertiajs/inertia-vue3";
import AppLayout from "@/Layouts/AppLayout";
import JetButton from "@/Jetstream/Button";
import JetFormSection from "@/Jetstream/FormSection";
import JetInput from "@/Jetstream/Input";
import JetInputError from "@/Jetstream/InputError";
import JetLabel from "@/Jetstream/Label";
import JetActionMessage from "@/Jetstream/ActionMessage";
import JetSecondaryButton from "@/Jetstream/SecondaryButton";
import JetSelect from "@/Components/Select";

export default {
  components: {
    AppLayout,
    JetActionMessage,
    JetButton,
    JetFormSection,
    JetInput,
    JetInputError,
    JetLabel,
    JetSecondaryButton,
    JetSelect,
  },

  props: {
    manageUser: Object,
  },

  setup(props) {
    const form = useForm({
      _method: "PUT",
      firstname: props.manageUser.firstname,
      lastname: props.manageUser.lastname,
      username: props.manageUser.username,
      email: props.manageUser.email,
      role: props.manageUser.role,
    });
    const roles = [
      {
        name: "Admin",
        value: "admin",
      },
      {
        name: "User",
        value: "user",
      },
    ];

    const updateProfileInformation = () => {
      form.post(route("users.update", props.manageUser.id), {
        preserveScroll: true,
      });
    };

    return { form, roles, updateProfileInformation };
  },
};
</script>
