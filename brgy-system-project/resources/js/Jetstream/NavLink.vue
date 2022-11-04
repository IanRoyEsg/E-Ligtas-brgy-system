<template>
    <inertia-link :href="href" :class="classes">
        <slot></slot>
    </inertia-link>
</template>

<script>
    export default {
        props: ['href', 'active'],

        computed: {
            classes() {
                return this.active
                            ? 'inline-flex items-center px-1 pt-1 border-b-2 border-red-400 text-sm text-red-500 font-bold leading-5 text-gray-900 focus:outline-none focus:border-red-700 transition'
                            : 'inline-flex items-center px-1 pt-1 border-b-2 border-transparent text-sm font-medium leading-5 text-gray-800 hover:text-red-700 hover:border-red-400 focus:outline-none focus:text-red-700 focus:border-red-300 transition'
            }
        }
    }
</script>
