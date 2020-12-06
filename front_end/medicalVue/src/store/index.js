import Vue from 'vue'
import Vuex from 'vuex'
import order from './order'
import product from './product'
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
    order,
    product
  }
})