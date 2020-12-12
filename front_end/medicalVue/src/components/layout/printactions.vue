<template>
      <q-fab
        v-model="fab2"
        external-label
        id="printPageButton"
        vertical-actions-align="left"
        color="blue-grey-5"
        icon="keyboard_arrow_down"
        direction="down"
      >
        <q-fab-action id="devisshow" external-label color="blue-grey-5" @click="$router.push({name: 'devisshow', params: { id: id }})"  icon="request_quote" label="Devis" />
        <q-fab-action id="printPageButton"  external-label color="blue-grey-5" @click="$router.push({name: 'Invoiceshow', params: { id: id }})"  icon="receipt_long" label="Facture" />
        <q-fab-action id="printPageButton"  external-label color="blue-grey-5" @click="$router.push({name: 'bonlivraison', params: { id: id }})"  icon="receipt" label="Bon Livraison" />
      </q-fab>  
</template>

<script>
export default {
  props:{
    id:{
    }
  },
  data(){
    return {
      fab2: true
    }
  }
}
</script>

<style>

</style>