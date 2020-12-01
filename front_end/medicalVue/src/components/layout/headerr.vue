<template>
<div>
    <q-header elevated class="bg-blue-grey-8">
        <q-toolbar>
            <q-toolbar-title>
                <strong>Admin</strong> panel
            </q-toolbar-title>
          <search/>
          <q-space ></q-space>
          <q-btn flat round dense icon="menu" @click="leftDrawerOpen = !leftDrawerOpen" class="q-mr-sm" />
        </q-toolbar>
      </q-header>
    <drawer :leftDrawerOpen="leftDrawerOpen"/>
</div>
</template>
<script>
import search from '../HeaderComponents/search.vue'
import drawer from '../HeaderComponents/drawerr.vue'
export default {
    components: {
        search,
        drawer
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