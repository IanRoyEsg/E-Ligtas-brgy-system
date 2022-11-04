<template>
<app-layout>

<!-- Header -->
    <header class="header" style="margin-top: -15px;">

        <div class=" container py-1 ">
             <h2 class="font-semibold text-xl text-gray-800 leading-tight text-center ">
                    <div class="border-solid border-4 border-blue-300 float-right py-3 px-3 bg-blue-100">
                     <!-- <p>Report Here</p> -->
                    <div class="py-2">
                    <button @click="openModal()" style="background-color: rgb(251, 76, 71); border-radius: 65px; font-size: 20px; line-height: 24px; text-transform: capitalize; text-decoration: none; border: none; outline: none;" class="inline-flex items-center px-4 py-2 bg-red-500 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-red-700 active:bg-red-900 focus:outline-none focus:border-red-900 focus:shadow-outline-red disabled:opacity-25 transition"  >Report</button>
                    </div>
                    </div>
             </h2>
            <div class="nav-frame py-1">

                <figure class="pageLogo">
                    <img :src="'/storage/images/bara3-ic.svg'" class="pageLogo__image" style="height:120px; margin-top:-10px;" alt="e-Ligtas Project">
                </figure>
                <div class="open-menu py-12" id="open-menu">
                    <div class="line"></div>
                    <div class="line"></div>
                    <div class="line"></div>
                </div>
                <nav class="nav-links " id="nav-links">


                </nav>
            </div>
        </div>
    </header>

    <!-- Main -->
    <main>
        <!--COVİD-19 Alert-->
        <section class="section hero">
            <div class="container">
                <div class="row direction">
                    <div class="col-12 col-md-6 col-lg-6 text-position" >
                        <h2 class="section__title">Barangay Alert</h2>
                        <span class="section__span">May ayuda na!</span>

                        <p class="section__desc" style="text-transform: none;">Bigayan ng ayuda sa ating covered basketball court. Panatilihin ang pagsusuot ng face mask at face shield, maintain social distancing at ugaliing magdala ng alcohol.</p>
                        <a href="//www.facebook.com/Brgy841SK/" class="section__button section__button--center" target="_blank">Learn More</a>
                    </div>
                    <div class="col-12 col-md-6 col-lg-6 text-position">
                        <img src="https://raw.githubusercontent.com/alaattinerby/Covid-19-Website/4c233460e18c1a8cfba4f7c4830e8da0e7c5e8e9/Covid-19/img/section-image.svg" class="section__image" alt="Quarantine">
                        <img src="https://raw.githubusercontent.com/alaattinerby/Covid-19-Website/4c233460e18c1a8cfba4f7c4830e8da0e7c5e8e9/Covid-19/img/section-virus.svg" class="section__virus1" alt="">
                        <img src="https://raw.githubusercontent.com/alaattinerby/Covid-19-Website/4c233460e18c1a8cfba4f7c4830e8da0e7c5e8e9/Covid-19/img/section-virus.svg" class="section__virus2" alt="">
                        <img src="https://raw.githubusercontent.com/alaattinerby/Covid-19-Website/4c233460e18c1a8cfba4f7c4830e8da0e7c5e8e9/Covid-19/img/section-virus.svg" class="section__virus3" alt="">
                    </div>
                </div>


                <!-- report -->
                 <div class="fixed z-10 inset-0 overflow-y-auto ease-out duration-400" v-if="isOpen">
                      <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">

                        <div class="fixed inset-0 transition-opacity">
                          <div class="absolute inset-0 bg-gray-500 opacity-75"></div>
                        </div>
                        <!-- This element is to trick the browser into centering the modal contents. -->
                        <span class="hidden sm:inline-block sm:align-middle sm:h-screen"></span>​
                        <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full" role="dialog" aria-modal="true" aria-labelledby="modal-headline">
                          <form>
                          <div class="bg-blue-200 px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                            <div class="">
                              <span class="text-lg font-bold flex justify-center mb-3 text-gray-500" style=" letter-spacing: 0.05em;">Report</span>
                                  <div class="mb-4">
                                      <label for="exampleFormControlInput1" class="block text-gray-500 text-sm font-bold mb-2">Subject:</label>
                                      <input type="text" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline bg-blue-100" id="exampleFormControlInput1" placeholder="Enter subject" v-model="form.title">
                                      <div v-if="$page.props.errors.title" class="text-red-500">{{ $page.props.errors.title }}</div>
                                  </div>
                                  <div class="mb-4">
                                      <label for="exampleFormControlInput2" class="block text-gray-700 text-sm font-bold mb-2">Message:</label>
                                      <textarea class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline bg-blue-100" id="exampleFormControlInput2" v-model="form.body" placeholder="Enter message"></textarea>
                                      <div v-if="$page.props.errors.body" class="text-red-500">{{ $page.props.errors.body }}</div>
                                  </div>
                            </div>
                          </div>
                          <div class="bg-blue-200 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                            <span class="flex w-full rounded-md shadow-sm sm:ml-3 sm:w-auto">
                              <button wire:click.prevent="store()" type="button" class="inline-flex justify-center w-full rounded-md border border-transparent px-4 py-2 bg-green-600 text-base leading-6 font-medium text-white shadow-sm hover:bg-green-500 focus:outline-none focus:border-green-700 focus:shadow-outline-green transition ease-in-out duration-150 sm:text-sm sm:leading-5" style="height:40px; margin-top:17px;" v-show="!editMode" @click="save(form)">
                                Send
                              </button>
                            </span>
                            <span class="flex w-full rounded-md shadow-sm sm:ml-3 sm:w-auto">
                              <button wire:click.prevent="store()" type="button" class="inline-flex justify-center w-full rounded-md border border-transparent px-4 py-2 bg-green-600 text-base leading-6 font-medium text-white shadow-sm hover:bg-green-500 focus:outline-none focus:border-green-700 focus:shadow-outline-green transition ease-in-out duration-150 sm:text-sm sm:leading-5" v-show="editMode" @click="update(form)">
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
                     <!-- report end -->
            </div>
        </section>

        <!--What Is Covid-19-->
        <section class="section coronavirus">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-6 col-lg-6 text-position">
                        <figure class="covidImage">
                            <img src="https://raw.githubusercontent.com/alaattinerby/Covid-19-Website/main/Covid-19/img/covid-image.png" class="covidImage__image" alt="Corona Virus">
                        </figure>
                    </div>
                    <div class="col-12 col-md-6 col-lg-6 text-position">
                        <h1 class="coronavirus__title">Ano ang Coronavirus?</h1>
                        <span class="coronavirus__span">Coronavirus</span>
                        <p class="coronavirus__desc" style="text-transform: none;">
                            Ang Coronaviruses ay mga pamilya ng mga virus
                            na nagdudulot ng sakit mula sa karaniwang sipon hanggang sa
                            mas malubhang sakit tulad ng Middle East Respiratory Sydrome
                            (MERS) at Severe Acute Respiratory Syndrome (SARS).
                        </p>
                        <a href="//www.euro.who.int/en/health-topics/health-emergencies/coronavirus-covid-19/novel-coronavirus-2019-ncov" target="_blank" class="coronavirus__button">Learn More</a>
                    </div>
                </div>
            </div>
        </section>

        <!--Contagion-->
        <section class="section contagion">
            <div class="container">
                <div class="upside upside--top">
                    <h2 class="upside__title">Nakakahawa ba ang coronavirus ng tao sa tao</h2>
                    <span class="upside__span">Contagion</span>
                    <p class="upside__desc" style="text-transform: none;">
                        Ayon sa kasalukuyang sitwasyon, maaaring maipasa ng tao sa tao (Human to human transmission).
                        kadalasan ay nangyayari ito sa malapitang pakikipagsalamuha sa iba ng taong mayroon nito. gaya ng sa bahay, trabaho o health facility.
                    </p>
                </div>
                <div class="row">
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="card">
                            <figure class="card__figure">
                                <img src="https://raw.githubusercontent.com/alaattinerby/Covid-19-Website/main/Covid-19/img/card1-image.png" class="card__image" alt="">
                            </figure>
                            <h3 class="card__title">Air Transmission</h3>
                            <p class="card__desc" style="text-transform: none;"> Gaya ng sa aerosols, kumakalat ang coronavirus sa pamamagitan ng respiratory droplets.</p>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="card">
                            <figure class="card__figure">
                                <img src="https://github.com/alaattinerby/Covid-19-Website/blob/main/Covid-19/img/card2-image.png?raw=true" class="card__image" alt="">
                            </figure>
                            <h3 class="card__title">Human Contacts</h3>
                            <p class="card__desc" style="text-transform: none;">Sabihin agad sa inyong Barangay Health worker kung ikaw ay nakasalamuha sa isang covid+ person. </p>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="card">
                            <figure class="card__figure">
                                <img src="https://github.com/alaattinerby/Covid-19-Website/blob/main/Covid-19/img/card3-image.png?raw=true" class="card__image" alt="">
                            </figure>
                            <h3 class="card__title">Contained Objects</h3>
                            <p class="card__desc" style="text-transform: none;">Lumayo at takpan ang bibig at ilong kapag uubo at babahing gamit ang panyo o tissue.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Symtomps -->
        <section class="symptomps" id="symptoms">
            <div class="container">
                <div class="upside top">
                    <h2 class="upside__title">Covid-19</h2>
                    <span class="upside__span">Symptoms</span>
                    <p class="upside__desc" style="text-transform: none;">
                       Ang mga karaniwang sintomas na dulot ng coronavirus ay lagnat, ubo't sipon.
                       hirap at pag-iksi ng paghinga at iba pang problema sa daluyan ng hangi.
                       Sa mga malulubhang kaso, maaari itong maging sanhi ng pneumonia, acute respiratory syndrome, at pagkamatay.
                    </p>
                </div>
                <div class="row">
                    <div class="col-12 col-md-12 col-lg-12">
                        <figure class="symptomps__figure">
                            <img src="https://github.com/alaattinerby/Covid-19-Website/blob/main/Covid-19/img/symptomps.png?raw=true" class="symptomps__image" alt="">
                        </figure>
                    </div>
                </div>
            </div>
        </section>

        <!-- Prevention -->
        <section class="prevention" id="prevention">
            <div class="container">
                <div class="upside">
                    <h2 class="upside__title">Covid-19</h2>
                    <span class="upside__span">Ano ang magagawa mo upang maiwasan ang pagkalat ng Novel Coronavirus</span>
                    <p class="upside__desc" style="text-transform: none;">
                        Lumayo at takpan ang bibig at ilong kapag uubo at babahin gamit ang panyo/tissue.
                        kumain ng masustansyang pagkain upang mapalakas ang immune system.
                    </p>
                </div>
                <div class="row row-position">
                    <div class="col-12 col-md-6 col-lg-6">
                        <span class="prevention__span"><span class="prevention__number">01</span> Wear your Mask</span>
                        <p class="prevention__desc" style="text-transform: none;">
                             Laging magsuot ng mask kapag aalis o nasalabas ng bahay.
                           Itapon nang maayos ang gamit na mask sa basurahan.
                        </p>
                    </div>
                    <div class="col-12 col-md-6 col-lg-6 ">
                        <figure class="prevention__figure">
                            <img src="https://github.com/alaattinerby/Covid-19-Website/blob/main/Covid-19/img/prevention1.png?raw=true" class="prevention__image" alt="">
                        </figure>
                    </div>
                </div>
                <div class="row row-position">
                    <div class="col-12 col-md-6 col-lg-6 ">
                        <span class="prevention__span"><span class="prevention__number">02</span>Wash Your Hands</span>
                        <p class="prevention__desc" style="text-transform: none;">
                            Ugaliin ang madalas na paghuhugas ng kamay gamit ang sabon at tubig.
                             Maaari ring gumamit ng Alcohol o based hand sanitizer
                        </p>
                    </div>
                    <div class="col-12 col-md-6 col-lg-6">
                        <figure class="prevention__figure">
                            <img src="https://github.com/alaattinerby/Covid-19-Website/blob/main/Covid-19/img/prevention2.png?raw=true" class="prevention__image" alt="">
                        </figure>
                    </div>
                </div>
                <div class="row row-position">
                    <div class="col-12 col-md-6 col-lg-6 ">
                        <span class="prevention__span"><span class="prevention__number">03</span>Use nose - rag</span>
                        <p class="prevention__desc" style="text-transform: none;">
                            Iwasan pumunta sa matataong lugar o kong maaari ay huwag ng umalis ng bahay kong di naman kinakailangan.
                        </p>
                    </div>
                    <div class="col-12 col-md-6 col-lg-6 ">
                        <figure class="prevention__figure">
                            <img src="https://github.com/alaattinerby/Covid-19-Website/blob/main/Covid-19/img/prevention3.png?raw=true" class="prevention__image" alt="">
                        </figure>
                    </div>
                </div>
                <div class="row row-position">
                    <div class="col-12 col-md-6 col-lg-6 ">
                        <span class="prevention__span"><span class="prevention__number">04</span>Avoid contacts</span>
                        <p class="prevention__desc" style="text-transform: none;">
                             Panatilihing malinis ang mga bagay na palaging nahahawakan tulad ng mga doorknobs, cellphone, ibabaw ng mesa at mga gamit sa banyo.
                        </p>
                    </div>
                    <div class="col-12 col-md-6 col-lg-6">
                        <figure class="prevention__figure">
                            <img src="https://github.com/alaattinerby/Covid-19-Website/blob/main/Covid-19/img/prevention4.png?raw=true" class="prevention__image" alt="">
                        </figure>
                    </div>
                </div>
            </div>
        </section>



        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <div class="row align-center">
                    <div class="col-12 col-md-3 col-lg-3">
                        <!-- <figure class="logo-figure">
                            <img :src="'/storage/images/bara3-ic.svg'" style="height:100px; margin-top:-70px;" class="footer__logo" alt="">
                        </figure> -->
                    </div>
                    <div class="col-12 col-md-6 col-lg-6r">
                        <a href="#top" class="footer__link">Home</a>
                        <a href="#symptoms" class="footer__link">Symptoms</a>
                        <a href="#prevention" class="footer__link">Prevention</a>

                    </div>

                </div>
            </div>
        </footer>
    </main>
</app-layout>

</template>

<style>

</style>

<script>
    import AppLayout from './../Layouts/AppLayout'
    import Welcome from './../Jetstream/Welcome'
    export default {
        components: {
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
                this.$inertia.post('/resreports', data)
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
                this.$inertia.post('/resreports/' + data.id, data)
                this.reset();
                this.closeModal();
            },
            deleteRow: function (data) {
                if (!confirm('Are you sure want to remove?')) return;
                data._method = 'DELETE';
                this.$inertia.post('/resreports/' + data.id, data)
                this.reset();
                this.closeModal();
            }
        }

  }


</script>





