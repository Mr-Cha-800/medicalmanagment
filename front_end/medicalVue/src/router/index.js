import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
// User managment
import SearchUsers from '../views/SearchUsers.vue'
import ListUsers from '../views/GestionClient.vue'
import ModifyClient from '../views/ModifyClient.vue'

// product managmeent
import NewOrder from '../views/NewOrder.vue'
import NewOrderOldDossier from '../components/Homecomponents/neworderolddossier.vue'
import NewDevis from '../views/NewDevis.vue'
import ProductManagment from '../views/ProductManagment.vue'
import modifierproduit from '../components/ProductManagmentComponents/modifier.vue'
import creerproduit from '../components/ProductManagmentComponents/creer.vue'
import chercheproduit from '../components/ProductManagmentComponents/recherche.vue'
// history managment 
import InvoiceHistory from '../views/InvoiceHistory.vue'
import Invoicesearch from '../components/buyingHistoryComponents/recherche.vue'
import Settings from '../views/Settings.vue'
import Invoiceshow from '../components/buyingHistoryComponents/invoice.vue'

// Gestiondevis
import Gestiondevis from '../views/Gestiondevis.vue'
import devisshow from '../components/buyingHistoryComponents/devis.vue'
import bonlivraison from '../components/buyingHistoryComponents/bonLivraison.vue'
import test from '../components/settings/test'
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
    path: '/SearchUsers',
    name: 'SearchUsers',
    component: SearchUsers
  },
  {
    path: '/ListUsers',
    name: 'ListUsers',
    component: ListUsers
  },
  {
    path: '/ModifyClient/:id',
    name: 'ModifyClient',
    component: ModifyClient
  },
  {
    path: '/NewOrder',
    name: 'NewOrder',
    component: NewOrder
  },
  {
    path: '/NewOrderOldDossier',
    name: 'NewOrderOldDossier',
    component: NewOrderOldDossier
  },
  {
    path: '/NewDevis',
    name: 'NewDevis',
    component: NewDevis
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
    path: '/Gestiondevis',
    name: 'Gestiondevis',
    component: Gestiondevis
  },
  {
    path: '/Gestiondevis/devis/:id',
    name: 'devisshow',
    component: devisshow ,
    meta: {
      header: 1
    }
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
    path: '/InvoiceHistory/bonlivraison/:id',
    name: 'bonlivraison',
    component: bonlivraison ,
    meta: {
      header: 1
    }
  },
  {
    path: '/Settings',
    name: 'Settings',
    component: Settings
  },
  {
    path: '/test/:id',
    name: 'test',
    component: test,
    meta: {
      header: 1
    }
  },
]

const router = new VueRouter({
  mode: 'hash',
  base: process.env.BASE_URL,
  routes
})

export default router
