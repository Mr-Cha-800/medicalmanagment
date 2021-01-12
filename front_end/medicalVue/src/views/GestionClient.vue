<template>
  <div class="q-pa-xl q-gutter-xl">
    <SearchUsers/>

    <UsersSearchedd />
  </div>
</template>

<script>
import SearchUsers from '../components/GestionDevis/SearchUsers.vue'
import UsersSearchedd from '../components/GestionDevis/UserSearchedd.vue'
export default {
  components:{
    SearchUsers,
    UsersSearchedd
  }
}
</script>

<style>

</style>