import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
// product managmeent
import NewOrder from '../views/NewOrder.vue'
import ProductManagment from '../views/ProductManagment.vue'
import modifierproduit from '../components/ProductManagmentComponents/modifier.vue'
import creerproduit from '../components/ProductManagmentComponents/creer.vue'
import chercheproduit from '../components/ProductManagmentComponents/recherche.vue'
// history managment 
import InvoiceHistory from '../views/InvoiceHistory.vue'
import Invoicesearch from '../components/buyingHistoryComponents/recherche.vue'
import Settings from '../views/Settings.vue'
import Invoiceshow from '../components/buyingHistoryComponents/invoice.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {
    path: '/NewOrder',
    name: 'NewOrder',
    component: NewOrder
  },
  {
    path: '/ProductManagment',
    name: 'ProductManagment',
    component: ProductManagment
  },
  {
    path: '/ProductManagment/edit/:id',
    name: 'modifierproduit',
    component: modifierproduit
  },
  {
    path: '/ProductManagment/creer',
    name: 'creerproduit',
    component: creerproduit
  },
  {
    path: '/ProductManagment/recherche',
    name: 'chercheproduit',
    component: chercheproduit
  },
  {
    path: '/InvoiceHistory',
    name: 'InvoiceHistory',
    component: InvoiceHistory
  },
  {
    path: '/InvoiceHistory/recherche',
    name: 'Invoicesearch',
    component: Invoicesearch
  },
  {
    path: '/InvoiceHistory/invoice/:id',
    name: 'Invoiceshow',
    component: Invoiceshow,
    meta: {
      header: 1
    }
  },
  {
    path: '/Settings',
    name: 'Settings',
    component: Settings
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
