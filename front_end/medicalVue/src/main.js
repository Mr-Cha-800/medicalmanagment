import Vue from 'vue'
import App from './App.vue'
import './quasar'
import store from './store'
import router from './router'
import * as moment from 'moment'
import 'moment/locale/fr'

Vue.use(require('number-formatter'))
Vue.use(require('vue-moment'))

moment.locale('fr')
Vue.config.productionTip = false
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
