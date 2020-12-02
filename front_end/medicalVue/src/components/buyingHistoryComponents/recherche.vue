<template>
  <div class="q-pa-xl q-gutter-xl">
    <SearchHistory/>
    <historySearched/>  
    <q-page-sticky position="bottom-right" class="q-pa-xl" :offset="[18, 18]">
      <q-btn fab icon="add"  @click="$router.push({name: 'NewOrder'})"  color="blue-grey-5" ><q-tooltip anchor="top middle">nouvelle commande</q-tooltip></q-btn>
    </q-page-sticky>
  </div>
</template>

<script>
import historySearched from './historySearched.vue'
import SearchHistory from './searchHistory.vue'
export default {
    components:{
        SearchHistory,
        historySearched
    }
}
</script>

<style>

</style>