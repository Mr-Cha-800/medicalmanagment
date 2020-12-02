<template>
  <div class="q-pa-xl q-gutter-xl">
    <search/>
    <ProductManagment/>
    <q-page-sticky position="bottom-right" :offset="[18, 18]">
      <q-btn fab icon="add" @click="$router.push({name: 'creerproduit'})"  color="blue-grey-5" ><q-tooltip>Ajouter un produit</q-tooltip></q-btn>
    </q-page-sticky>
  </div>
</template>

<script>
import search from '../components/Homecomponents/search.vue'
import ProductManagment from '../components/ProductManagmentComponents/products.vue'
export default {
  components: {
    search,
    ProductManagment
  }
}
</script>

<style>

</style>