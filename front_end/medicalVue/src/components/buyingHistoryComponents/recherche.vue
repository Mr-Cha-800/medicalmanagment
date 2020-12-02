<template>
  <div class="q-pa-xl q-gutter-xl">
    <SearchHistory/>
    <historySearched/>  
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