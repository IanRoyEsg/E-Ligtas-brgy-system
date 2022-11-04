<template>
  <app-layout>
    <template #header>
      <h2 class="font-semibold text-xl text-gray-800 leading-tight">
        Users Show
      </h2>
    </template>

    <div class="py-12">
      <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
        <div class="text-gray-600 bg-blue-300 overflow-hidden shadow-xl sm:rounded-lg px-4 py-5">
          <span class="text-lg font-bold">Resident Details</span> <br />
          First Name: {{ manageUser.firstname }}<br />
          Last Name: {{ manageUser.lastname }}<br />
          Username: {{ manageUser.username }}<br />
          Email: {{ manageUser.email }}<br />
          Role: {{ manageUser.role }}<br />
          Date joined: {{ manageUser.created_at }}<br />
          Updated at: {{ manageUser.updated_at }}<br />
        </div>
      </div>
    </div>
  </app-layout>
</template>

<script>
import AppLayout from "@/Layouts/AppLayout";

export default {
  components: {
    AppLayout,
  },

  props: {
    manageUser: Object
  },
};
</script>
