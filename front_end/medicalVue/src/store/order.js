import axios from 'axios'
export default {
    namespaced: true,
    state:{
        order: {},
        orders: []
    },
    getters:{
        getallorders(state){
            return state.orders
        },
        getorder(state){
            return state.order
        }
    },
    mutations:{
        neworder(state, order){
            state.order = order
        },
        setallorders(state, orders){
            state.orders = orders
        },
        setorder(state, order){
            state.order = order
        }
    },
    actions:{
        async order(_, order){
            return new Promise((resolve, reject) => {
                axios.post('/factures', {
                    id:order.id,
                    nom: order.nom,
                    prenom: order.prenom,
                    numsecsocial: order.securitesociale,
                    numtel: order.tel,
                    caisse: order.caisse,
                    wilaya: order.wilaya,
                    commande: order.commande,
                    year: order.year,
                    patientnom: order.patient.nom,
                    patientprenom: order.patient.prenom,
                    patientdatenaiss: order.patient.datenaiss,
                    patientlieunaiss: order.patient.lieunaissance,
                    montanttotal: order.montanttotal,
                    remise: order.remise
                })
                  .then(response => {
                    resolve(response)
                    // console.log(response)
                  })
                  .catch(error => {
                    reject(error)
                  })
              })
        },
        async setorders({ commit }){
            return new Promise((resolve, reject) => {
                axios.get('/factures')
                  .then(response => {
                      commit('setallorders', response.data)
                    resolve(response)
                    // console.log(response)
                  })
                  .catch(error => {
                    reject(error)
                  })
              })
        },
        async setoneorder({ commit },id){
            return new Promise((resolve, reject) => {
                axios.get('/factures/'+ id)
                  .then(response => {
                      commit('setorder', response.data)
                    resolve(response)
                    // console.log(response)
                  })
                  .catch(error => {
                    reject(error)
                  })
              })
        },
        async searchfacture({ commit }, search){
          search = '%'+search+'%'
            return new Promise((resolve, reject) => {
                axios.post('/factures/recherche', {
                  Search : search
                })
                  .then(response => {
                    commit('setallorders', response.data)
                    resolve(response)
                    // console.log(response)
                  })
                  .catch(error => {
                    reject(error)
                  })
              })
        }

    }
}