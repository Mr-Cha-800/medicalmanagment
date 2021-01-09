import Vue from 'vue'

import './styles/quasar.scss'
import '@quasar/extras/material-icons/material-icons.css'
import { Quasar, Notify,QSpinner, QSpinnerHourglass } from 'quasar'

Vue.use(Quasar, {
  components:{QSpinner,QSpinnerHourglass},
  config: {},
  plugins: {
    Notify
  }
 })