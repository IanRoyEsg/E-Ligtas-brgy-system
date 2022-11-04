<template>
  <app-layout>
    <template #header>
      <h2 class="font-semibold text-xl text-gray-800 leading-tight">
        Posts Show
      </h2>
    </template>

    <div class="py-12 ">
      <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
        <div class="text-gray-600 bg-blue-300 overflow-hidden shadow-xl sm:rounded-lg px-4 py-5">
          <h2 class="text-xl font-bold">{{ post.title }}</h2>
          <div class="mb-2">Author: {{ post.user.firstname }} {{ post.user.lastname }}</div>
          <div class="whitespace-pre-line">Content: {{ post.content }}</div>
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
    post: Object,
  },
};
</script>
