<template>
<div>
    <q-header elevated class="bg-blue-grey-8">
        <q-toolbar>
            <q-toolbar-title>
                <strong>Admin</strong> panel
            </q-toolbar-title>
            <q-btn no-caps flat>Nouvelle commande</q-btn>
            <q-btn no-caps flat>Gestion de produit</q-btn>
            <q-btn no-caps flat>Historique des achats</q-btn>
          <!--<search/>-->
          <q-space ></q-space>
          <q-btn flat round dense icon="settings" class="q-mr-sm" >
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