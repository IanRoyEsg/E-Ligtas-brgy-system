<template>
  <app-layout>
    <template #header>
      <h2 class="font-semibold text-xl text-gray-800 leading-tight text-center">
        User List
        <!-- <inertia-link
          class="float-right"
          :href="route('users.create')"
          v-if="$page.props.permission.users.create"
        >
          <jet-button>Create</jet-button>
        </inertia-link> -->
      </h2>
    </template>

     <!-- <inertia-link
          class="flex justify-center mt-3"
          :href="route('users.create')"
          v-if="$page.props.permission.users.create">
          <jet-button>Create User</jet-button>
        </inertia-link> -->
<figure class="pageLogo">
            <img :src="'/storage/images/people.svg'" class="pageLogo__image" style="height: 70px; margin-left:650px; margin-top:15px;" alt="e-Ligtas Project">
        </figure>

    <div class="-py-10 mt-4" style=" width: 1170px; margin-left:100px;">
      <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
        <!-- <jet-input
          type="text"
          class="block ml-2 mb-4 w-50 h-8"
          v-model="form.search"
          placeholder="Search user..."
        /> -->


        <jet-input
          type="text"
          class="block ml-1 mb-4 w-50 h-8"
          v-model="form.search"
          placeholder="Search user..." style="background: #fff;
          box-shadow: 0px 8px 80px rgba(0, 0, 0, 0.06);
          border-radius: 57px;
          padding: 20px 30px;
          outline: none;
          border: none;
          color: #758681;
          letter-spacing: 0.07em;
          font-size: 14px; margin-top:-75px;
          background-color: rgba(239, 246, 255);"
        />
        <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">
          <div class="flex flex-col">
            <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8" >
              <div
                class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8"
              >
                <div
                  class="shadow overflow-hidden border-b border-blue-200 sm:rounded-lg bg-blue-200"
                >
                  <table class="min-w-full divide-y divide-blue-200">
                    <thead class="bg-blue-300">
                      <tr>
                        <th
                          scope="col"
                          class="px-6 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >

                        </th>
                        <th
                          scope="col"
                          class="px-6 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          First Name
                        </th>
                        <th
                          scope="col"
                          class="px-6 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          Last Name
                        </th>
                        <th
                          scope="col"
                          class="px-6 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          Email
                        </th>
                        <th
                          scope="col"
                          class="px-6 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          Role
                        </th>
                        <th
                          scope="col"
                          class="px-6 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          Joined
                        </th>
                        <th
                          scope="col"
                          class="px-6 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          Action
                        </th>
                        <th scope="col" class="relative px-6 py-3">
                          <span class="sr-only">Edit</span>
                        </th>
                      </tr>
                    </thead>
                    <tbody class="bg-blue-200 divide-y divide-blue-200">
                      <tr v-if="!users.data.length">
                        <td class="p-4 text-center text-gray-900" colspan="5">
                          No data
                        </td>
                      </tr>
                      <tr v-for="user in users.data" :key="user.id">
                        <td class="px-6 py-2 whitespace-nowrap">
                          <div class="flex items-center">
                            <div class="flex-shrink-0 h-10 w-10">
                              <img
                                class="h-10 w-10 rounded-lg"
                                :src="user.profile_photo_url"
                                alt=""
                              />
                            </div>
                          </div>
                        </td>
                        <td
                          class="px-6 py-2 whitespace-nowrap text-sm text-gray-900"
                        >
                          {{ user.firstname }}
                        </td>
                        <td
                          class="px-6 py-2 whitespace-nowrap text-sm text-gray-900"
                        >
                          {{ user.lastname }}
                        </td>
                         <td
                          class="px-6 py-2 whitespace-nowrap text-sm text-gray-900"
                        >
                          {{ user.email }}
                        </td>

                        <td
                          class="px-6 py-2 whitespace-nowrap text-sm text-gray-900"
                        >
                          {{ user.role }}
                        </td>
                        <td
                          class="px-6 py-2 whitespace-nowrap text-sm text-gray-900"
                        >
                          {{ user.created_at }}
                        </td>
                        <td
                          class="px-6 py-2 whitespace-nowrap text-right text-sm font-medium"
                        >
                          <inertia-link
                            :href="route('users.show', user.id)"
                            class="-ml-7 text-indigo-600 hover:text-indigo-900"
                            v-if="user.can.view"
                            >Show</inertia-link
                          >
                          <inertia-link
                            :href="route('users.edit', user.id)"
                            class="ml-2 text-indigo-600 hover:text-indigo-900"
                            v-if="user.can.update"
                            >Edit</inertia-link
                          >
                          <button
                            @click="deleteUser(user.id)"
                            class="ml-2 text-red-600 hover:text-red-900"
                            v-if="user.can.delete"
                          >
                            Delete
                          </button>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <jet-pagination class="m-2" :links="users.links" />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </app-layout>
</template>

<script>
import { reactive, watchEffect } from "vue";
import { pickBy } from "lodash";
import { Inertia } from "@inertiajs/inertia";
import AppLayout from "@/Layouts/AppLayout";
import JetButton from "@/Jetstream/Button";
import JetInput from "@/Jetstream/Input";
import JetPagination from "@/Components/Pagination";

export default {
  components: {
    AppLayout,
    JetButton,
    JetInput,
    JetPagination,
  },

  props: {
    users: Object,
    filters: Object,
  },

  setup(props) {
    const form = reactive({
      search: props.filters.search,
    });

    watchEffect(() => {
      const query = pickBy(form);

      Inertia.replace(
        route("users.index", Object.keys(query).length ? query : {})
      );
    });

    // return { form };
     const deleteUser = (userId) => {
        const result = confirm("Are you sure you want to remove this user?");
        if (result) {
          Inertia.delete(route("users.destroy", userId), {
            preserveScroll: true,
          });
        }
      };

      return { form, deleteUser };
  },
};
</script>
