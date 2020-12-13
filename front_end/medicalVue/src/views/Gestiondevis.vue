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
    <DevisTable :deviss="devis"/>
    <neworderbutton/>
  </div>
</template>

<script>
import neworderbutton from '../components/layout/newOrderButton.vue'
import DevisTable from '../components/GestionDevis/DevisTable.vue'
import SearchDevis from '../components/GestionDevis/SearchDevis.vue'
export default {
    data(){
        return {
            devis: "Non-Payé"
        }
    },
  components:{
    neworderbutton,
    DevisTable,
    SearchDevis
  }
}
</script>

<style>

</style>