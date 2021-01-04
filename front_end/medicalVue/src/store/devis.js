import axios from 'axios'
export default {
    namespaced: true,
    state:{
      devis: [],
      dossier: [],
      user: {}
    },
    getters:{
      getalldevis(state){
        return state.devis
      },
      getallusers(state){
        return state.dossier
      },
      getuser(state){
        return state.user
      }

    },
    mutations:{
      setalldevis(state, devis){
        state.devis = devis
      },
      setallusers(state, users){
        state.dossier = users
      },
      setuser(state, id){
        state.user = state.dossier.filter(x => x.ID === id)
      }
    },
    actions:{
      // recuperer tous les devis
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
      // supprimer un devis
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
        // chercher un devis
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
        },
        // finaliser un devis
        async finaliserdevis({ dispatch }, productId){
            return new Promise((resolve, reject) => {
                axios.patch('/factures/finaliser', {
                    Id: productId
                })
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
        // chercher un utilisateur pour client existant
        async searchusers({ commit }, search){
          search = '%'+search+'%'
            return new Promise((resolve, reject) => {
                axios.post('/info/recherche', {
                  Search : search
                })
                  .then(response => {
                    commit('setallusers', response.data)
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