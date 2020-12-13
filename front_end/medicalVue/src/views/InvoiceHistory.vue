<template>
  <div class="q-pa-xl q-gutter-xl">
    <SearchHistory/>
    <historytable/>
    <neworderbutton/>
  </div>
</template>

<script>
import neworderbutton from '../components/layout/newOrderButton.vue'
import historytable from '../components/buyingHistoryComponents/historytable.vue'
import SearchHistory from '../components/buyingHistoryComponents/searchHistory.vue'
export default {
  components:{
    neworderbutton,
    historytable,
    SearchHistory
  }
}
</script>

<style lang="scss" scoped>

</style>