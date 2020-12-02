<template>
  <div class="q-pa-xl q-gutter-xl">
    <search/>
    <productsearched/>  
  </div>
</template>

<script>
import search from '../Homecomponents/search.vue'
import productsearched from '../ProductManagmentComponents/productsearched.vue'
export default {
    components:{
        search,
        productsearched
    }
}
</script>

<style>

</style>