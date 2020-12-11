import Vue from 'vue'
import Vuex from 'vuex'
import order from './order'
import product from './product'
import company from './company'
import devis from './devis'
import axios from 'axios'
Vue.use(Vuex)
axios.defaults.baseURL = 'http://127.0.0.1:3000'
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
    product,
    company,
    devis
  }
})