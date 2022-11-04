<template>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/css/bootstrap-grid.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display:wght@700&display=swap" rel="stylesheet">
  <div>
    <jet-banner />

<!-- gray content background-->
    <div class="min-h-screen bg-blue-200">
      <nav class=" border-b border-blue-200 bg-blue-200 bg-opacity-50"
      style="box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1)">
        <!-- Primary Navigation Menu -->
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8" >
          <div class="flex justify-between h-16">
            <div class="flex">




               <div class="ml-3 relative">
                <jet-dropdown align="center" width="48">
                  <template #trigger>
                    <button
                      v-if="$page.props.jetstream.managesProfilePhotos"
                      class="flex text-sm border-2 border-transparent rounded-full focus:outline-none"
                    >
                    <img
                        class="h-10 w-10 rounded-lg object-cover mr-3 mt-2"
                        :src="$page.props.user.profile_photo_url"
                        :alt="$page.props.user.firstname" style="margin-left: 45px;"
                      />
                    <template v-if="$page.props.user">
                      <span class="capitalize mt-4 text-base font-base text-gray-800">Welcome,</span>
                      <span class="ml-1 mt-4  text-base font-base text-gray-800" >{{ $page.props.user.firstname }}</span>
                    </template>
                    <span class="capitalize mt-4 text-base font-base text-gray-800" v-else>Welcome, User!</span>

                    </button>

                    <span v-else class="inline-flex rounded-md">
                      <button
                        type="button"
                        class="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-gray-500 bg-white hover:text-gray-700 focus:outline-none transition"
                      >
                        {{ $page.props.user.firstname }}

                        <svg
                          class="ml-2 -mr-0.5 h-4 w-4"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 20 20"
                          fill="currentColor"
                        >
                          <path
                            fill-rule="evenodd"
                            d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                            clip-rule="evenodd"
                          />
                        </svg>
                      </button>
                    </span>
                  </template>

                  <template #content>
                    <!-- Account Management -->
                    <div class="block px-4 py-2 text-xs text-gray-400 bg-blue-100">
                      Account Management
                    </div>

                    <jet-dropdown-link :href="route('profile.show')" >
                      Profile
                    </jet-dropdown-link>

                    <div class="border-t border-blue-100"></div>

                    <!-- Authentication -->
                    <form @submit.prevent="logout">
                      <jet-dropdown-link as="button">
                        Log Out
                      </jet-dropdown-link>
                    </form>
                  </template>
                </jet-dropdown>
              </div>

              <!-- Logo -->

              <!-- Navigation Links -->

            </div>

            <div class="hidden sm:flex sm:items-center sm:ml-6">
               <!-- Navigation Links -->
               <div class="hidden space-x-8 sm:-my-px sm:ml-10 sm:flex" style="margin-right: 63px;">
                 <jet-nav-link
                  :href="route('resreports.index')"
                  :active="route().current('resreports.index')"
                  v-if="$page.props.permission.users.viewAny"
                >
                  Reports
                </jet-nav-link>

                <jet-nav-link
                  :href="route('users.index')"
                  :active="route().current('users.*')"
                  v-if="$page.props.permission.users.viewAny"
                >
                  Residents
                </jet-nav-link>
                <jet-nav-link
                  :href="route('covids.index')"
                  :active="route().current('covids.index')"
                  v-if="$page.props.permission.users.viewAny"
                >
                  Covid+
                </jet-nav-link>
                <jet-nav-link
                  :href="route('posts.index')"
                  :active="route().current('posts.*')"
                  v-if="$page.props.permission.users.viewAny"
                >
                  Announcements
                </jet-nav-link>
                 <jet-nav-link
                  :href="route('dashboard')"
                  :active="route().current('dashboard')"
                >
                  Home
                </jet-nav-link>
              </div>

              <!-- Settings Dropdown -->
              <!-- Fish -->
              <!-- <div class="flex-shrink-0 flex items-center ml-3" style="margin-right: 60px;">
                <inertia-link :href="route('dashboard')">
                  <jet-application-mark class="block h-9 w-auto" />
                </inertia-link>
              </div> -->
             <!-- Fish -->
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
            style="background-color: rgba(55, 65, 81)">
              Home
            </jet-responsive-nav-link>
            <jet-responsive-nav-link
              :href="route('users.index')"
              :active="route().current('users.*')"
              v-if="$page.props.permission.users.viewAny"
            >
              Residents
            </jet-responsive-nav-link>
            <jet-responsive-nav-link
              :href="route('posts.index')"
              :active="route().current('posts.*')"
              v-if="$page.props.permission.posts.viewAny"
            >
              Announcements
            </jet-responsive-nav-link>
            <jet-responsive-nav-link
              :href="route('covids.index')"
              :active="route().current('covids.*')"
              v-if="$page.props.permission.posts.viewAny"
            >
              Covid+
            </jet-responsive-nav-link>
            <jet-responsive-nav-link
              :href="route('resreports.index')"
              :active="route().current('resreports.*')"
              v-if="$page.props.permission.posts.viewAny"
            >
              Reports
            </jet-responsive-nav-link>
          </div>

          <!-- Responsive Settings Options -->
          <div class="pt-4 pb-1 border-t border-gray-200">
            <div class="flex items-center px-4">
              <div
                v-if="$page.props.jetstream.managesProfilePhotos"
                class="flex-shrink-0 mr-3"
              >
                <img
                  class="h-10 w-10 rounded-full object-cover"
                  :src="$page.props.user.profile_photo_url"
                  :alt="$page.props.user.firstname"
                />
              </div>

              <div>
                <div class="font-medium text-base text-gray-800">
                  {{ $page.props.user.firstname }}
                </div>
                <div class="font-medium text-sm text-gray-500">
                  {{ $page.props.user.email }}
                </div>
              </div>
            </div>

            <div class="mt-3 space-y-1">
              <jet-responsive-nav-link
                :href="route('profile.show')"
                :active="route().current('profile.show')"
              >
                Profile
              </jet-responsive-nav-link>

              <!-- <jet-responsive-nav-link
                :href="route('api-tokens.index')"
                :active="route().current('api-tokens.index')"
                v-if="$page.props.jetstream.hasApiFeatures"
              >
                API Tokens
              </jet-responsive-nav-link> -->

              <!-- Authentication -->
              <form method="POST" @submit.prevent="logout">
                <jet-responsive-nav-link as="button">
                  Log Out
                </jet-responsive-nav-link>
              </form>

              <!-- Team Management -->
              <template v-if="$page.props.jetstream.hasTeamFeatures">
                <div class="border-t border-gray-200"></div>

                <div class="block px-4 py-2 text-xs text-gray-400">
                  Manage Team
                </div>

                <!-- Team Settings -->
                <jet-responsive-nav-link
                  :href="route('teams.show', $page.props.user.current_team)"
                  :active="route().current('teams.show')"
                >
                  Team Settings
                </jet-responsive-nav-link>

                <jet-responsive-nav-link
                  :href="route('teams.create')"
                  :active="route().current('teams.create')"
                >
                  Create New Team
                </jet-responsive-nav-link>

                <div class="border-t border-gray-200"></div>

                <!-- Team Switcher -->
                <div class="block px-4 py-2 text-xs text-gray-400">
                  Switch Teams
                </div>

                <template
                  v-for="team in $page.props.user.all_teams"
                  :key="team.id"
                >
                  <form @submit.prevent="switchToTeam(team)">
                    <jet-responsive-nav-link as="button">
                      <div class="flex items-center">
                        <svg
                          v-if="team.id == $page.props.user.current_team_id"
                          class="mr-2 h-5 w-5 text-green-400"
                          fill="none"
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          stroke="currentColor"
                          viewBox="0 0 24 24"
                        >
                          <path
                            d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"
                          ></path>
                        </svg>
                        <div>{{ team.firstname }}</div>
                      </div>
                    </jet-responsive-nav-link>
                  </form>
                </template>
              </template>
            </div>
          </div>
        </div>
      </nav>

      <!-- Page Heading -->
      <!-- <header class="bg-white shadow" v-if="$slots.header">
        <div class="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
          <slot name="header"></slot>
        </div>
      </header> -->

      <!-- Page Content -->
      <main>
        <slot></slot>
      </main>
    </div>
  </div>
</template>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    /* font-family: Roboto; */
}
:root {
    --fontColor: #035755;
    --fontRedHat: 'Red Hat Display', sans-serif;
}
body {
    /* background: linear-gradient(180deg, rgba(255, 141, 155, 0.1) 0%, rgba(255, 255, 255, 1) 10%); */
   background: linear-gradient(180deg, rgba(152, 141, 255, 0.1) 0%, rgb(235, 237, 245) 10%);
}
.header {
    padding-top: 31px;
    padding-bottom: 31px;
}
.header .nav-frame {
    display: flex;
    justify-content: space-between;
    position: relative;
    flex-direction: column;
}
.header .pageLogo {
    height: 60px;
    width: 189px;
}
/* .header .open-menu {
    cursor: pointer;
    border: 1px solid #035755;
    border-radius: 20%;
    position: absolute;
    right: 0;
    top: 15px;
}
.header .open-menu .line {
    width: 30px;
    height: 3px;
    background-color: #ff5476;
    margin: 5px;
} */
.header .nav-links {
    position: absolute;
    flex-direction: column;
    border: 1px solid silver;
    border-radius: 0 0 10px 10px;
    display: none;
    background-color: rgba(255, 255, 255, 0.8);
    top: 70px;
    width: 100%;
    z-index: 1;
}
.header .nav-links .nav-link {
    position: relative;
    font-size: 15px;
    color: var(--fontColor);
    text-decoration: none;
    text-align: center;
    margin: 10px 0px;
    cursor: pointer;
}
.header .nav-links .nav-link.active {
    color: #fb4c47;
}
.header .nav-links .nav-link:hover {
    color: #fb4c47;
}
.nav-links.nav-open {
    display: flex;
    padding-bottom: 10px;
}
.section {
    padding-bottom: 100px;
}
.section .direction {
    display: flex;
    align-items: center;
    flex-direction: column-reverse;
}
.section .center {
    display: flex;
    align-items: center;
}
.section__title {
    font-family: var(--fontRedHat);
    font-weight: bold;
    font-size: 24px;
    line-height: 70px;
    color: #fa5652;
}
.section__span {
    font-family: var(--fontRedHat);
    font-weight: bold;
    font-size: 36px;
    line-height: 40px;
    color: #221C4A;
    text-transform: capitalize;
}
.section__desc {
    margin-top: 20px;
    font-family: Roboto;
    font-weight: normal;
    font-size: 18px;
    line-height: 30px;
    color: #4b4f51;
    text-transform: capitalize;
}
.section__button {
    position: relative;
    top: 40px;
    padding: 15px 40px;
    font-size: 15px;
    color: #fff;
    text-decoration: none;
    background: #fb4c47;
    box-shadow: 0px 8px 87px rgba(0, 0, 0, 0.1);
    border-radius: 65px;
    font-weight: 600;
    letter-spacing: 0.05em;
}
.section__button:hover {
    box-shadow: 0px 0px 20px rgba(199, 199, 199, 0.7);
    transition: 0.3s ease;
}
.section__image {
    width: 300px;
    z-index: 0;
}
.section__virus1 {
    position: absolute;
    bottom: 40px;
    left: 0px;
    width: 150px;
    z-index: -1;
    animation: spin 10s linear infinite;
}
.section__virus2 {
    position: absolute;
    top: 0;
    right: 0px;
    width: 100px;
    opacity: 0.8;
    z-index: -1;
    animation: spin 20s linear infinite;
}
.section__virus3 {
    position: absolute;
    top: 200px;
    right: 40px;
    width: 100px;
    z-index: -1;
    animation: spin 20s linear infinite;
}
@keyframes spin {
    100% {
        -webkit-transform: rotate(360deg);
   }
}
.section .covidImage__image {
    width: 330px;
}
.coronavirus__title {
    font-weight: bold;
    font-family: var(--fontRedHat);
    font-size: 20px;
    line-height: 124%;
    color: #fa5652;
}
.coronavirus__span {
    font-weight: bold;
    font-size: 40px;
    font-family: var(--fontRedHat);
    line-height: 60px;
    text-transform: capitalize;
    color: #221C4A;
}
.coronavirus__desc {
    margin-top: 18px;
    font-weight: normal;
    font-size: 20px;
    line-height: 30px;
    text-transform: capitalize;
    color: #4b4f51;
    font-family: Roboto;
}
.coronavirus__button {
    position: relative;
    background: rgba(250, 86, 82, 0.15);
    border-radius: 65px;
    padding: 21px 50px;
    font-weight: 600;
    font-size: 15px;
    line-height: 24px;
    top: 55px;
    text-transform: capitalize;
    color: #fa5652;
    text-decoration: none;
}
.coronavirus__button:hover {
    box-shadow: 0px 0px 20px rgba(199, 199, 199, 0.2);
}
.upside {
    margin-bottom: 70px;
}
.upside__title {
    font-family: var(--fontRedHat);
    font-weight: bold;
    font-size: 20px;
    text-align: center;
    color: #fa5652;
    margin-top: 40px;
}
.upside__span {
    display: block;
    font-family: var(--fontRedHat);
    font-weight: bold;
    font-size: 40px;
    text-align: center;
    text-transform: capitalize;
    color: #221C4A;
    margin-bottom: 20px;
}
.upside__desc {
    font-family: Roboto;
    font-weight: normal;
    font-size: 18px;
    line-height: 30px;
    text-align: center;
    text-transform: capitalize;
    color: #4b4f51;
}
.contagion .card {
    box-shadow: 0px 5px 30px rgba(0, 0, 0, 0.08);
    border-radius: 10px;
    margin-bottom: 30px;
    text-align: center;
    padding: 40px 30px 60px;
    min-height: 450px;
    overflow: hidden;
    cursor: pointer;
    border-bottom: 6px solid #fa5652;
    border: none;
}
.contagion .card:hover {
    box-shadow: 0px 5px 30px rgba(0, 0, 0, 0.15);
    border-bottom: 6px solid #fa5652;
}
.contagion .card__figure {
    margin: auto;
    display: block;
    width: 250px;
}
.contagion .card__image {
    width: 220px;
}
.contagion .card__title {
    margin-top: 30px;
    font-weight: bold;
    font-size: 20px;
    line-height: 147%;
    text-transform: capitalize;
    color: #221C4A;
    display: -webkit-box;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
    overflow: hidden;
}
.contagion .card__desc {
    margin-top: 13px;
    font-size: 16px;
    line-height: 25px;
    text-align: center;
    text-transform: capitalize;
    color: #4b4f51;
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
}
.symptomps {
    text-align: center;
}
.symptomps__image {
    width: 300px;
}
.symptomps__left {
    position: absolute;
    bottom: 90px;
    left: 20px;
    width: 80px;
}
.prevention {
    text-align: center;
}
.prevention .row-position {
    display: flex;
    align-items: center;
}
.prevention .row-position:nth-child(odd) {
    flex-direction: row-reverse;
}
.prevention__image {
    margin-top: 30px;
    width: 330px;
}
.prevention__span {
    font-weight: bold;
    font-size: 30px;
    text-transform: capitalize;
    color: #221C4A;
    align-items: center;
    display: inline-flex;
}
.prevention__number {
    padding: 10px;
    margin-right: 15px;
    background: rgba(250, 86, 82, 0.15);
    text-transform: capitalize;
    color: #fa5652;
    font-size: 30px;
    border-radius: 100%;
}
.prevention__desc {
    margin-top: 20px;
    font-weight: normal;
    font-size: 18px;
    line-height: 30px;
    text-transform: capitalize;
    color: #4b4f51;
}
.contact {
    margin-top: 50px;
}
.contact .help {
    position: relative;
}
.contact .help__desc {
    margin: auto;
    font-weight: bold;
    font-size: 40px;
    line-height: 60px;
    text-align: center;
    color: #0c6c44;
}
.contact .help__mail {
    background: #fff;
    box-shadow: 0px 8px 80px rgba(0, 0, 0, 0.06);
    border-radius: 57px;
    padding: 30px 40px;
    outline: none;
    border: none;
    margin-top: 50px;
    width: 100%;
    font-size: 14px;
}
.contact .help__mail::placeholder {
    font-size: 14px;
    color: #758681;
    letter-spacing: 0.07em;
}
.contact .help__send {
    position: absolute;
    background: #f44a45;
    border-radius: 157px;
    border: none;
    font-weight: 500;
    font-size: 14px;
    line-height: 26px;
    color: #fff;
    padding: 10px 30px;
    right: 15px;
    bottom: 15px;
    outline: none;
    cursor: pointer;
}
.footer {
    text-align: center;
    padding-bottom: 50px;
}
.footer .logo-figure {
    margin-top: 30px;
    margin-bottom: 10px;
}
.footer__link {
    font-size: 13px;
    line-height: 28px;
    color: #221C4A;
    text-decoration: none;
    cursor: pointer;
}
.footer__link:not(:last-of-type) {
    margin-right: 10px;
}
.footer .social-figure {
    text-align: center;
    margin: auto;
    margin-top: 25px;
}
.footer .social-figure a:not(:last-of-type) {
    margin-right: 15px;
}
.top {
    margin-top: -60px;
}
.text-position {
    text-align: center;
}
@media screen and (min-width: 768px) {
    .row.direction {
        flex-direction: row;
   }
    .open-menu {
        display: none;
   }
    .nav-frame {
        flex-direction: row;
   }
    .header .nav-links {
        width: auto;
        display: inline-flex;
        flex-direction: row;
        position: absolute;
        right: 0;
        top: 50%;
        border: none;
        transform: translateY(-50%);
        background-color: transparent;
   }
    .header .nav-links .nav-link {
        display: flex;
        align-items: center;
   }
    .header .nav-links .nav-link:not(:last-child) {
        margin-right: 20px;
   }
    .header .nav-links .nav-link:last-child {
        border: 2px solid #fb4c47;
        border-radius: 46px;
        padding: 10px 35px;
        color: #ff383d;
   }
    .header .nav-links .nav-link:last-child:hover {
        background-color: #fb4c47;
        color: #fff;
        transition: 0.3s;
   }
    .header .nav-links .nav-link.active::after, .header .nav-links .nav-link:not(:last-of-type):hover::after {
        position: absolute;
        content: "";
        width: 10px;
        height: 10px;
        background-color: #fa5652;
        bottom: -15px;
        left: 50%;
        transform: translateX(-50%);
        border-radius: 100%;
   }
    .text-position {
        text-align: left;
   }
    .coronavirus .covidImage {
        margin-top: 75px;
   }
    .upside--top {
        margin-top: -60px;
   }
    .upside__title {
        margin-top: 40px;
   }
    .upside__desc {
        width: 80%;
        margin: auto;
   }
    .symptomps__image {
        width: 600px;
   }
    .prevention {
        text-align: left;
   }
    .prevention__image {
        width: 300px;
   }
    .help {
        margin: auto;
        width: 70%;
   }
    .footer {
        padding-top: 100px;
   }
    .footer .logo-figure, .footer .social-figure {
        margin: 0;
        align-items: center;
   }
    .footer .align-center {
        display: flex;
        align-items: center;
   }
}
@media screen and (min-width: 992px) {
    #nav-links .nav-link:not(:last-child) {
        margin-right: 40px;
   }
    .section .text-position {
        text-align: left;
   }
    .section__image {
        width: 500px;
   }
    .section__virus1 {
        top: 0px;
        left: -40px;
        width: 110px;
   }
    .coronavirus .covidImage {
        margin: 0;
   }
    .coronavirus .covidImage__image {
        width: 450px;
   }
    .coronavirus__desc {
        text-align: left;
   }
    .symptomps__image {
        width: 800px;
   }
    .prevention__desc {
        padding-left: 70px;
   }
    .prevention__image {
        width: 450px;
   }
    .help {
        margin: auto;
        width: 40%;
   }
}
</style>

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

  methods: {
    switchToTeam(team) {
      this.$inertia.put(
        route("current-team.update"),
        {
          team_id: team.id,
        },
        {
          preserveState: false,
        }
      );
    },

    logout() {
      this.$inertia.post(route("logout"));
    },
  },
};
</script>
