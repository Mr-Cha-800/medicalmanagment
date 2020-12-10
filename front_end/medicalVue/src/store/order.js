import axios from 'axios'
export default {
    namespaced: true,
    state:{
        order: {}
    },
    getters:{
    },
    mutations:{
        neworder(state, order){
            state.order = order
        }
    },
    actions:{
        async order(_, order){
            return new Promise((resolve, reject) => {
                axios.post('/factures', {
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
                    montanttotal: order.montanttotal
                })
                  .then(response => {
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