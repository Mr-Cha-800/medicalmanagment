import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import NewOrder from '../views/NewOrder.vue'
import ProductManagment from '../views/ProductManagment.vue'
import InvoiceHistory from '../views/InvoiceHistory.vue'
import Settings from '../views/Settings.vue'

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
    path: '/InvoiceHistory',
    name: 'InvoiceHistory',
    component: InvoiceHistory
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
