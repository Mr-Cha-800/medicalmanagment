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
            console.log(order.commande)
            return new Promise((resolve, reject) => {
                axios.post('/neworder', {
                    nom: order.nom,
                    prenom: order.prenom,
                    numId: order.numId,
                    numPermis: order.numPermis,
                    commande: order.commande
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