<template>
  <div class="q-pa-xl q-gutter-xl">
    <SearchUsers/>

    <UsersSearched />
  </div>
</template>

<script>
import SearchUsers from '../components/GestionDevis/SearchUsers.vue'
import UsersSearched from '../components/GestionDevis/UsersSearched.vue'
export default {
  components:{
    SearchUsers,
    UsersSearched
  }
}
</script>

<style>

</style>