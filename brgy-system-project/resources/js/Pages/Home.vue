<template>
  <guest-layout >
    <!-- <template #header>
      <h2 class="font-semibold text-xl text-gray-800 leading-tight">
        Announcements
      </h2>
    </template> -->
      <h2 class="font-semibold text-3xl text-gray-600 leading-tight" style="margin-left: 70px; margin-top: 25px; margin-bottom: -30px;">
        Guidelines and Announcements:
      </h2>
    <div class="py-12">
      <div
        class="max-w-7xl mx-auto sm:px-6 lg:px-8 mb-4"
        v-for="post in posts.data"
        :key="post.id"
      >
        <div class="text-gray-600 bg-blue-300 overflow-hidden shadow-xl sm:rounded-lg px-4 py-5">
          <h2 class="text-xl font-bold">{{ post.title }}</h2>
          <div class="mb-2">Author: {{ post.user.firstname }} {{ post.user.lastname }}</div>
          <div class="whitespace-pre-line">{{ post.content }}</div>
        </div>
      </div>
    </div>
  </guest-layout>
</template>

<script>
import GuestLayout from "@/Layouts/GuestLayout";

export default {
  components: {
    GuestLayout,
  },

  props: {
    posts: Object,
  },
};
</script>
