import Vue from 'vue'
import Vuex from 'vuex'
import order from './order'
Vue.use(Vuex)
export default new Vuex.Store({
  state: {
    products: []
  },
  mutations: {
  },
  actions: {
  },
  modules: {
    order
  }
})