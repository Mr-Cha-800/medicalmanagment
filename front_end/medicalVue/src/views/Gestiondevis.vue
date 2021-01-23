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
     <q-tabs
          v-model="tab"
          dense
          class="text-grey"
          active-color="white"
          indicator-color="white"
          align="justify"
          narrow-indicator
        >
          <q-tab name="mails" icon="warning" class="bg-red text-white shadow-2" label="Devis sans cash" />
          <q-tab name="alarms" icon="info" class="bg-primary text-white shadow-2" label="Devis cash" />
       </q-tabs>

        <q-separator />

        <q-tab-panels v-model="tab" animated
          transition-prev="jump-up"
          transition-next="jump-up">
          <q-tab-panel name="mails">
            <div class="text-h6">Devis sans cash</div>
            <div class="wrapper">
            
            <DevisTable :deviss="devis"/>
            </div>
          </q-tab-panel>

          <q-tab-panel name="alarms">
            <div class="text-h6">devis avec cash</div>
            <div class="wrapper">
            <DevisBerkTable :deviss="devis"/>

          </div>
          </q-tab-panel>
        </q-tab-panels>

    <neworderbutton/>
  </div>
</template>

<script>
import neworderbutton from '../components/layout/newOrderButton.vue'
import DevisTable from '../components/GestionDevis/DevisTable.vue'
import DevisBerkTable from '../components/GestionDevis/DevisBerkTable.vue'
import SearchDevis from '../components/GestionDevis/SearchDevis.vue'
export default {
    data(){
        return {
            devis: "Non-Payé",
            tab: 'mails'
        }
    },
  components:{
    neworderbutton,
    DevisTable,
    DevisBerkTable,
    SearchDevis
  }
}
</script>

<style lang="scss" scoped>
.wrapper{
  margin: 0 auto;
  padding: 20px;
  width:100%;
}
</style>