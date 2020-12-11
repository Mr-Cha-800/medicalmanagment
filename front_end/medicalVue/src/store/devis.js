import axios from 'axios'
export default {
    namespaced: true,
    state:{
      devis: []
    },
    getters:{
      getalldevis(state){
        return state.devis
      }
    },
    mutations:{
      setalldevis(state, devis){
        state.devis = devis
      }
    },
    actions:{
      async setdevis({ commit }){
          return new Promise((resolve, reject) => {
              axios.get('/factures/devis')
                .then(response => {
                    commit('setalldevis', response.data)
                  resolve(response)
                  // console.log(response)
                })
                .catch(error => {
                  reject(error)
                })
            })
      },
        async deletedevis({dispatch},id){
            return new Promise((resolve, reject) => {
                axios.delete('/factures/devis/'+ id)
                  .then(response => {
                    dispatch('setdevis')
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
                axios.post('/factures/recherche/devis', {
                  Search : search
                })
                  .then(response => {
                    commit('setalldevis', response.data)
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