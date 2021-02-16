<template>
  <q-layout view="lHh Lpr lFf" class="bg-grey-4">
    <Headerr v-if="$route.meta.header !== 1"/>
    <q-page-container>
    <keep-alive>
      <router-view></router-view>
    </keep-alive>
    </q-page-container>
  </q-layout>
</template>

<script>
import Headerr from './components/layout/headerr'
export default {
  name: 'LayoutDefault',
  components: {
    Headerr
  },
}
</script>
<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;

  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
</style>
