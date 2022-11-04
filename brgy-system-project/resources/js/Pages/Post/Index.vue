<template>
  <app-layout>
    <template #header>
      <h2 class="font-semibold text-xl text-gray-800 leading-tight text-center">
        Announcement List
        <!-- <inertia-link
          class="float-right"
          :href="route('posts.create')"
          v-if="$page.props.permission.posts.create">
          <jet-button>Create</jet-button>
        </inertia-link> -->
      </h2>
    </template>

    <inertia-link
          class="flex justify-end mt-4"
          :href="route('posts.create')"
          v-if="$page.props.permission.posts.create">
          <jet-button style="position: relative;
          background-color: rgb(251, 76, 71);
          border-radius: 65px;
          font-size: 15px;
          line-height: 24px;
          text-transform: capitalize;
          text-decoration: none;
          border:none;
          outline: none;
          margin-right:125px;
          ">Create Announcement</jet-button>
        </inertia-link>

      <figure class="pageLogo">
            <img :src="'/storage/images/loudspeaker.svg'" class="pageLogo__image" style="height:80px; margin-left:650px; margin-top:-60px;" alt="e-Ligtas Project">
        </figure>

    <div class="-py-10 -mt-10" style=" width: 1170px; margin-left:100px; margin-top:-50px;">
      <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
        <jet-input
          type="text"
          class="block ml-1 mb-4 w-50 h-8"
          v-model="form.search"
          placeholder="Search post..." style="background: #fff;
          box-shadow: 0px 8px 80px rgba(0, 0, 0, 0.06);
          border-radius: 57px;
          padding: 20px 30px;
          outline: none;
          border: none;
          color: #758681;
          letter-spacing: 0.07em;
          font-size: 14px;
          background-color: rgba(239, 246, 255);"
        />

        <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">
          <div class="flex flex-col">
            <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
              <div
                class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8"
              >
                <div
                  class="shadow overflow-hidden border-b border-blue-200 sm:rounded-lg bg-blue-200"
                >
                  <table class="min-w-full divide-y divide-blue-200">
                    <thead class="bg-blue-300">
                      <tr>
                        <!-- <th
                          scope="col"
                          class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          ID
                        </th> -->
                        <th
                          scope="col"
                          class="px-6 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          Title
                        </th>
                        <th
                          scope="col"
                          class="px-6 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          Created At
                        </th>
                        <th
                          scope="col"
                          class="px-6 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          Updated At
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
                      <tr v-if="!posts.data.length">
                        <td class="p-4 text-center text-gray-900" colspan="5">
                          No data
                        </td>
                      </tr>
                      <tr v-for="post in posts.data" :key="post.id">
                        <!-- <td
                          class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"
                        >
                          {{ post.id }}
                        </td> -->
                        <td
                          class="px-6 py-3 whitespace-nowrap text-sm text-gray-900"
                        >
                          {{ post.title }}
                        </td>
                        <td
                          class="px-6 py-3 whitespace-nowrap text-sm text-gray-900"
                        >
                          {{ post.created_at }}
                        </td>
                        <td
                          class="px-6 py-3 whitespace-nowrap text-sm text-gray-900"
                        >
                          {{ post.updated_at }}
                        </td>
                        <td
                          class="px-6 py-3 whitespace-nowrap text-right text-sm font-medium"
                        >
                          <inertia-link
                            :href="route('posts.show', post.id)"
                            class="-ml-10 text-indigo-600 hover:text-indigo-900"
                            v-if="post.can.view"
                            >View</inertia-link
                          >
                          <inertia-link
                            :href="route('posts.edit', post.id)"
                            class="ml-2 text-indigo-600 hover:text-indigo-900"
                            v-if="post.can.update"
                            >Edit</inertia-link
                          >
                          <button
                            @click="deletePost(post.id)"
                            class="ml-2 text-red-600 hover:text-red-900"
                            v-if="post.can.delete"
                          >
                            Delete
                          </button>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <jet-pagination class="m-2" :links="posts.links"/>
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
    posts: Object,
    filters: Object,
  },

  setup(props) {
    const form = reactive({
      search: props.filters.search,
      page: props.filters.page,
    });

    watchEffect(() => {
      const query = pickBy(form);

      Inertia.replace(
        route("posts.index", Object.keys(query).length ? query : {})
      );
    });

    const deletePost = (postId) => {
      const result = confirm("Are you sure you want to remove this announcement?");
      if (result) {
        Inertia.delete(route("posts.destroy", postId), {
          preserveScroll: true,
        });
      }
    };

    return { form, deletePost };
  },
};
</script>
