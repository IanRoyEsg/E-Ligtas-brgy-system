<template>
    <app-layout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Covid Positive List

            </h2>

        </template>
              <!-- <div class="flex justify-center mt-3">
                <jetbutton @click="openModal()" class="cursor-pointer inline-flex items-center px-4 py-2 bg-gray-800 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 active:bg-gray-900 focus:outline-none focus:border-gray-900 focus:shadow-outline-gray disabled:opacity-25 transition">Add Resident</jetbutton>
               </div> -->

        <div class="flex justify-end mt-4 mr-16">
          <jet-button @click="openModal()" style="position: relative;
          background-color: rgb(251, 76, 71);
          border-radius: 65px;
          font-size: 15px;
          line-height: 24px;
          text-transform: capitalize;
          text-decoration: none;
          border:none;
          outline: none;
          margin-right:60px;">Add Resident</jet-button>
        </div>

 <figure class="pageLogo">
            <img :src="'/storage/images/cough.svg'" class="pageLogo__image" style="height:80px; margin-left:650px; margin-top:-55px;" alt="e-Ligtas Project">
        </figure>


        <div class="py-6" style=" width: 1150px; margin-left:110px; margin-top: -15px;">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-5">
                <div class="bg-blue overflow-hidden shadow-xl sm:rounded-lg ">
                   <div
                  class="shadow overflow-hidden border-b border-blue-200 sm:rounded-lg bg-blue-200">
                    <div role="alert" v-if="$page.props.flash.message">
                      <div class="flex">
                        <div>
                          <p class="text-sm">{{ $page.props.flash.message }}</p>
                        </div>
                      </div>
                    </div>


                     <table class="table-fixed w-full bg-blue-200 ">
                        <thead class="flex w-full bg-blue-200">
                            <tr class="flex w-full mb-4 ">
                                <th class="px-6 py-2 w-1/8 border-b-2 border-blue-200 bg-blue-300 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">No.</th>
                                <th class="px-6 py-2 w-1/4 border-b-2 border-blue-200 bg-blue-300 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Name</th>
                                <th class="px-6 py-2 w-1/2 border-b-2 border-blue-200 bg-blue-300 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Information</th>
                                <th class="px-6 py-2 w-1/4 border-b-2 border-blue-200 bg-blue-300 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Action</th>
                            </tr>
                        </thead>

                    <div class="myBox">
                        <tbody class="bg-blue-200 flex flex-col items-center justify-between w-full" style="height: 50vh;">
                            <tr v-for="(row, index) in data" :key="index" class="flex w-full mb-4">
                                <td class="px-6 py-1 w-1/8 border-b border-blue-200 bg-blue-200 text-sm ">{{ row.id }}</td>
                                <td class="px-6 py-1 w-1/4 border-b border-blue-200 bg-blue-200 text-sm">{{ row.title }}</td>
                                <td class="px-6 py-1 w-1/2 border-b border-blue-200 bg-blue-200 text-sm flex flex-no-wrap overflow-x-scroll scrolling-touch">{{ row.body }}</td>
                                <td class="px-6 py-1 w-1/4 border-b border-blue-200 bg-blue-200 text-sm">
                                    <button @click="edit(row)"  class="ml-2 text-indigo-600 hover:text-indigo-900">Edit</button>
                                    <button @click="deleteRow(row)"  class="ml-2 text-red-600 hover:text-red-900">Delete</button>
                                </td>
                            </tr>

                        </tbody>
                    </div>
                    </table>
                    </div>
                    <div class="fixed z-10 inset-0 overflow-y-auto ease-out duration-400" v-if="isOpen">
                      <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">

                        <div class="fixed inset-0 transition-opacity">
                          <div class="absolute inset-0 bg-gray-500 opacity-75"></div>
                        </div>
                        <!-- This element is to trick the browser into centering the modal contents. -->
                        <span class="hidden sm:inline-block sm:align-middle sm:h-screen"></span>​
                        <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full" role="dialog" aria-modal="true" aria-labelledby="modal-headline">
                          <form>
                          <div class="bg-blue-200 px-4 pt-4 pb-4 sm:p-6 sm:pb-4">
                           <span class="text-lg font-bold flex justify-center mb-3 text-gray-500" style=" letter-spacing: 0.05em;">Resident Details</span>
                            <div class="">
                                  <div class="mb-4">
                                      <label for="exampleFormControlInput1" class="block text-gray-500 text-sm font-bold mb-2">Name:</label>
                                      <input type="text" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-500 leading-tight focus:outline-none focus:shadow-outline bg-blue-100" id="exampleFormControlInput1" placeholder="Enter Name" v-model="form.title">
                                      <div v-if="$page.props.errors.title" class="text-red-500">{{ $page.props.errors.title }}</div>
                                  </div>
                                  <div class="mb-4">
                                      <label for="exampleFormControlInput2" class="block text-gray-500 text-sm font-bold mb-2">Information:</label>
                                      <textarea class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-500 leading-tight focus:outline-none focus:shadow-outline bg-blue-100" id="exampleFormControlInput2" v-model="form.body" placeholder="Enter Information"></textarea>
                                      <div v-if="$page.props.errors.body" class="text-red-500">{{ $page.props.errors.body }}</div>
                                  </div>
                            </div>
                          </div>
                          <div class="bg-blue-200 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">


<!--
                           <jet-nav-link
                            :href="route('covidshow.index')"
                            :active="route().current('covidshow.index')">
                            Posts
                          </jet-nav-link>
 -->

                            <span class="flex w-full rounded-md shadow-sm sm:ml-3 sm:w-auto">
                              <button wire:click.prevent="store()" type="button" class="inline-flex justify-center w-full rounded-md border border-transparent px-4 py-2 bg-green-600 text-base leading-6 font-medium text-white shadow-sm hover:bg-green-500 focus:outline-none focus:border-green-700 focus:shadow-outline-green transition ease-in-out duration-150 sm:text-sm sm:leading-5" style="height:40px; margin-top:17px;"  v-show="!editMode" @click="save(form)">
                                Save
                              </button>
                            </span>
                            <span class="flex w-full rounded-md shadow-sm sm:ml-3 sm:w-auto">
                              <button wire:click.prevent="store()" type="button" class="inline-flex justify-center w-full rounded-md border border-transparent px-4 py-2 bg-green-600 text-base leading-6 font-medium text-white shadow-sm hover:bg-green-500 focus:outline-none focus:border-green-700 focus:shadow-outline-green transition ease-in-out duration-150 sm:text-sm sm:leading-5" style="height:40px; margin-top:17px;"  v-show="editMode" @click="update(form)">
                                Update
                              </button>
                            </span>
                            <span class="mt-3 flex w-full rounded-md shadow-sm sm:mt-0 sm:w-auto">

                              <button @click="closeModal()" type="button" class="inline-flex justify-center w-full rounded-md border border-gray-300 px-4 py-2 bg-gray-400 text-base leading-6 font-medium text-white shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                Cancel
                              </button>
                            </span>
                          </div>
                          </form>

                        </div>
                      </div>
                    </div>
                </div>
            </div>
        </div>
    </app-layout>
</template>


<style>
  .myBox {
  border: none;
  padding: 1px;
  font: 24px/36px sans-serif;
  height:370px;
  overflow-y: scroll;
  overflow-x: hidden;
  }

  /* Scrollbar styles */
  ::-webkit-scrollbar {
  width: 10px;
  height: 10px;
  }

  ::-webkit-scrollbar-track {
  background: rgba(191, 219, 254);
  border-radius: 10px;
  }

  ::-webkit-scrollbar-thumb {
  border-radius: 10px;
  background: rgba(147, 197, 253);
  }

  ::-webkit-scrollbar-thumb:hover {
  background: rgba(96, 165, 250);
  }

  .button {
    background-color: #19547b;
    border: none;
    color: white;
    padding: 10px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 2px 1px;
    cursor: pointer;
    border-radius: 12px;
  }
</style>


<script>
    import AppLayout from './../Layouts/AppLayout'
    import Welcome from './../Jetstream/Welcome'
    import JetButton from "@/Jetstream/Button";
    export default {
        components: {
            JetButton,
            AppLayout,
            Welcome,
        },
        props: ['data', 'errors'],
        data() {
            return {
                editMode: false,
                isOpen: false,
                form: {
                    title: null,
                    body: null,
                },
            }
        },
        methods: {
            openModal: function () {
                this.isOpen = true;
            },
            closeModal: function () {
                this.isOpen = false;
                this.reset();
                this.editMode=false;
            },
            reset: function () {
                this.form = {
                    title: null,
                    body: null,
                }
            },
            save: function (data) {
                this.$inertia.post('/covids', data)
                this.reset();
                this.closeModal();
                this.editMode = false;
            },
            edit: function (data) {
                this.form = Object.assign({}, data);
                this.editMode = true;
                this.openModal();
            },
            update: function (data) {
                data._method = 'PUT';
                this.$inertia.post('/covids/' + data.id, data)
                this.reset();
                this.closeModal();
            },
            deleteRow: function (data) {
                if (!confirm('Are you sure you want to remove this resident?')) return;
                data._method = 'DELETE';
                this.$inertia.post('/covids/' + data.id, data)
                this.reset();
                this.closeModal();
            }
        }
    }
</script>
