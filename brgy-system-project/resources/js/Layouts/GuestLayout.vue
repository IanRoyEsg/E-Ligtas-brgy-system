<template>
  <div>
    <jet-banner />

    <div class="min-h-screen bg-blue-200">
      <nav class=" border-b border-blue-200 bg-blue-200 bg-opacity-50"
      style="box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1)">
        <!-- Primary Navigation Menu -->
        <div class="max-w-7xl mx-auto px-4 sm:px-6 md:-ml-10 lg:px-8 lg:-ml-10">
          <div class="flex justify-between h-16 sm:justify-end md:justify-end lg:space-x-40">
            <div class="flex ">
              <!-- Logo -->
              <!-- <div class="flex-shrink-0 flex items-center">
                <inertia-link
                  :href="route('home')"
                  :active="route().current('home')"
                >
                  <jet-application-mark class="block h-9 w-auto" />
                </inertia-link>
              </div> -->
                <!-- <figure class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8" style="height: 160px;
    width: 250px; margin-top: 10px; margin-left: 470px;"> -->
    <div class="flex-shrink-0 flex items-center sm:ml-120 md:ml-20 lg:ml-20">
              <figure class="md:mr-10">
                    <img :src="'/storage/images/welcome-ic.svg'" class="block h-9 w-auto" alt="e-Ligtas Barangay Logo">
                </figure>
    </div>

              <!-- Navigation Links -->
              <div class="hidden space-x-8 sm:-my-px sm:ml-10 sm:flex " style="margin-left:50%;">
                <!-- <jet-nav-link
                  :href="route('home')"
                  :active="route().current('home')"
                >
                  Home
                </jet-nav-link> -->

<!-- style="margin-left:320px" -->
                <jet-nav-link class="hidden space-x-8 sm:-my-px sm:ml-10 sm:flex"
                  :href="route('dashboard')"
                  :active="route().current('dashboard')"

                >Login</jet-nav-link>
                <jet-nav-link  class="hidden space-x-8 sm:-my-px sm:ml-10 sm:flex"
                  :href="route('register')"
                  :active="route().current('register')"
                >
                  Register
                </jet-nav-link>


              </div>
            </div>

            <div class="hidden sm:flex sm:items-center sm:ml-6">
              <div class="ml-3 relative"></div>
            </div>

            <!-- Hamburger -->
            <div class="-mr-2 flex items-center sm:hidden">
              <button
                @click="showingNavigationDropdown = !showingNavigationDropdown"
                class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500 transition"
              >
                <svg
                  class="h-6 w-6"
                  stroke="currentColor"
                  fill="none"
                  viewBox="0 0 24 24"
                >
                  <path
                    :class="{
                      hidden: showingNavigationDropdown,
                      'inline-flex': !showingNavigationDropdown,
                    }"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M4 6h16M4 12h16M4 18h16"
                  />
                  <path
                    :class="{
                      hidden: !showingNavigationDropdown,
                      'inline-flex': showingNavigationDropdown,
                    }"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M6 18L18 6M6 6l12 12"
                  />
                </svg>
              </button>
            </div>
          </div>
        </div>

        <!-- Responsive Navigation Menu -->
        <div
          :class="{
            block: showingNavigationDropdown,
            hidden: !showingNavigationDropdown,
          }"
          class="sm:hidden"
        >
          <div class="pt-2 pb-3 space-y-1">
            <jet-responsive-nav-link
              :href="route('dashboard')"
              :active="route().current('dashboard')"
            >
              Login
            </jet-responsive-nav-link>
          </div>
          <div class="pt-2 pb-3 space-y-1">
            <jet-responsive-nav-link
              :href="route('register')"
              :active="route().current('register')"
            >
              Register
            </jet-responsive-nav-link>
          </div>
        </div>
      </nav>

      <!-- Page Heading -->
      <header class="bg-white shadow" v-if="$slots.header">
        <div class="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
          <slot name="header"></slot>
        </div>
      </header>

      <!-- Page Content -->
      <main>
        <slot></slot>
      </main>
    </div>
  </div>
</template>

<script>
import JetApplicationMark from "@/Jetstream/ApplicationMark";
import JetBanner from "@/Jetstream/Banner";
import JetDropdown from "@/Jetstream/Dropdown";
import JetDropdownLink from "@/Jetstream/DropdownLink";
import JetNavLink from "@/Jetstream/NavLink";
import JetResponsiveNavLink from "@/Jetstream/ResponsiveNavLink";

export default {
  components: {
    JetApplicationMark,
    JetBanner,
    JetDropdown,
    JetDropdownLink,
    JetNavLink,
    JetResponsiveNavLink,
  },

  data() {
    return {
      showingNavigationDropdown: false,
    };
  },
};
</script>
