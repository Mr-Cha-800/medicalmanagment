<template>
  <div class="q-pa-xl q-gutter-xl">
    <SearchHistory/>
    <historytable/>
    <q-page-sticky position="bottom-right" class="q-pa-xl" :offset="[18, 18]">
      <q-btn fab icon="add"  @click="$router.push({name: 'NewOrder'})"  color="blue-grey-5" ><q-tooltip anchor="top middle">nouvelle commande</q-tooltip></q-btn>
    </q-page-sticky>
  </div>
</template>

<script>
import historytable from '../components/buyingHistoryComponents/historytable.vue'
import SearchHistory from '../components/buyingHistoryComponents/searchHistory.vue'
export default {
  components:{
    historytable,
    SearchHistory
  }
}
</script>

<style>

</style>