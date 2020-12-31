<template>
<div>
    <q-header elevated class="bg-blue-grey-8">
        <q-toolbar>
            <q-toolbar-title>
            <q-btn  @click="$router.push({name: 'Home'})" flat><strong>Ortho</strong>  Soft</q-btn>
            </q-toolbar-title>
            <!--<q-btn no-caps @click="$router.push({name: 'NewDevis'})" flat>Nouveau devis</q-btn>-->
            <choosing/>
            <q-btn no-caps @click="$router.push({name: 'ProductManagment'})" flat>Gestion des produits</q-btn>
            <q-btn no-caps @click="$router.push({name: 'InvoiceHistory'})" flat>Historique des achats</q-btn>
            <q-btn no-caps @click="$router.push({name: 'Gestiondevis'})" flat>Gestion de devis</q-btn>
          <!--<search/>-->
          <q-space ></q-space>
          <q-btn flat round dense icon="settings" @click="$router.push({name: 'Settings'})" class="q-mr-sm" >
            <q-tooltip>Reglage</q-tooltip>
          </q-btn>
        </q-toolbar>
      </q-header>
    <!--<drawer :leftDrawerOpen="leftDrawerOpen"/>-->
</div>
</template>
<script>
import choosing from '../GestionDevis/Choosing.vue'
// import search from '../HeaderComponents/search.vue'
//import drawer from '../HeaderComponents/drawerr.vue'
export default {
    components: {
      choosing
       // search,
        //drawer
    },
  data () {
    return {
      leftDrawerOpen: false,
    }
  },
  methods:{
  },
  computed:{
  },
  created() {
  }
}
</script>