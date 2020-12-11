import axios from 'axios'
export default {
    namespaced: true,
    state:{
    },
    getters:{
    },
    mutations:{
    },
    actions:{
        async deletedevis({dispatch},id){
            return new Promise((resolve, reject) => {
                axios.delete('/factures/devis/'+ id)
                  .then(response => {
                    dispatch('order/setorders',null ,{root:true})
                    resolve(response)
                    // console.log(response)
                  })
                  .catch(error => {
                    reject(error)
                  })
              })
        },
        async searchdevis({ commit }, search){
          search = '%'+search+'%'
            return new Promise((resolve, reject) => {
                axios.post('/factures/recherche', {
                  Search : search
                })
                  .then(response => {
                    commit('order/setallorders', response.data, { root: true })
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