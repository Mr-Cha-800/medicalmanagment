<template>
      <q-fab
        v-model="fab2"
        external-label
        id="printPageButton"
        vertical-actions-align="left"
        color="blue-grey-5"
        icon="keyboard_arrow_down"
        direction="down"
        :hide-label="hideLabels"
      >
        <q-fab-action id="devisshow" :hide-label="hideLabels" external-label color="blue-grey-5" @click="$router.push({name: 'devisshow', params: { id: id }})"  icon="mail" label="Devis" />
        <q-fab-action id="printPageButton" :hide-label="hideLabels" external-label color="blue-grey-5" @click="$router.push({name: 'Invoiceshow', params: { id: id }})"  icon="airplay" label="Facture" />
        <q-fab-action id="printPageButton" :hide-label="hideLabels" external-label color="blue-grey-5" @click="$router.push({name: 'bonlivraison', params: { id: id }})"  icon="alarm" label="Bon Livraison" />
      </q-fab>  
</template>

<script>
export default {
props:{
    id:{
        type: String
    }
}
}
</script>

<style>

</style>