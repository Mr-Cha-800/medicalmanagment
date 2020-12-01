// import axios from 'axios'
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
        order({ commit }, order){
            console.log(order.commande)
            commit('neworder', order)
        }
    }
}