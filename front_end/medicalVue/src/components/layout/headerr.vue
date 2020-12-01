<template>
<div>
    <q-header elevated class="bg-blue-grey-8">
        <q-toolbar>
            <q-toolbar-title>
            <q-btn  @click="$router.push({name: 'Home'})" flat><strong>Admin</strong>  panel</q-btn>
            </q-toolbar-title>
            <q-btn no-caps @click="$router.push({name: 'NewOrder'})" flat>Nouvelle commande</q-btn>
            <q-btn no-caps @click="$router.push({name: 'ProductManagment'})" flat>Gestion de produit</q-btn>
            <q-btn no-caps @click="$router.push({name: 'InvoiceHistory'})" flat>Historique des achats</q-btn>
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
// import search from '../HeaderComponents/search.vue'
//import drawer from '../HeaderComponents/drawerr.vue'
export default {
    components: {
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