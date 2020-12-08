<template>
  <div class="q-pa-xl q-gutter-xl">
    <SearchDevis/>

    <q-toggle
      :label="devis"
      checked-icon="done"
      unchecked-icon="clear"
      color="blue-grey-8"
      false-value="Non-Payé"
      true-value="Payé"
      v-model="devis"
    />
    <DevisTable/>
    <q-page-sticky position="bottom-right" class="q-pa-xl" :offset="[18, 18]">
      <q-btn fab icon="add"  @click="$router.push({name: 'NewOrder'})"  color="blue-grey-5" ><q-tooltip anchor="top middle">nouvelle commande</q-tooltip></q-btn>
    </q-page-sticky>
  </div>
</template>

<script>
import DevisTable from '../components/GestionDevis/DevisTable.vue'
import SearchDevis from '../components/GestionDevis/SearchDevis.vue'
export default {
    data(){
        return {
            devis: "Payé"
        }
    },
  components:{
    DevisTable,
    SearchDevis
  }
}
</script>

<style>

</style>