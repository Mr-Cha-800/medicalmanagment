<template>
  <div>
      <devis/>
      <invoice/>
      <bonlivraison/>
  </div>
</template>

<script>
import devis from '../buyingHistoryComponents/devis'
import invoice from '../buyingHistoryComponents/invoice'
import bonlivraison from '../buyingHistoryComponents/bonLivraison'
export default {
components:{ devis, invoice, bonlivraison}
}
</script>

<style>

</style>