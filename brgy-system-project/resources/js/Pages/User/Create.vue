<template>
  <app-layout>
    <template #header>
      <h2 class="font-semibold text-xl text-gray-800 leading-tight">
        Edit Profile
      </h2>
    </template>

    <div class="py-12">
      <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
        <jet-form-section @submitted="createUser">
          <template #title> Profile Information </template>

          <template #description>
            Update your account's profile information.
          </template>

          <template #form>
            <!-- First Name -->
            <div class="col-span-6 sm:col-span-4">
              <jet-label for="firstname" value="First Name" />
              <jet-input
                id="firstname"
                type="text"
                class="mt-1 block w-full"
                v-model="form.firstname"
                autocomplete="firstname"
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
              />
              <jet-input-error :message="form.errors.role" class="mt-2" />
            </div>
          </template>

          <template #actions>
            <jet-action-message :on="form.recentlySuccessful" class="mr-3">
              Saved.
            </jet-action-message>

            <jet-button
              :class="{ 'opacity-25': form.processing }"
              :disabled="form.processing"
            >
              Save
            </jet-button>
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



  setup() {
    const form = useForm({
      _method: "POST",
      firstname: "",
      lastname:  "",
      username:  "",
      email:  "",
      role:  "",
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

    const createUser = () => {
      form.post(route("users.store"));
    };

    return { form, roles, createUser };
  },
};
</script>
