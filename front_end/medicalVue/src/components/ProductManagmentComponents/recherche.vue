<template>
  <div class="q-pa-xl q-gutter-xl">
    <search/>
    <ProductManagment/>  
  </div>
</template>

<script>
import search from '../Homecomponents/search.vue'
import ProductManagment from '../ProductManagmentComponents/productsearched.vue'
export default {
    components:{
        search,
        ProductManagment
    }
}
</script>

<style>

</style>