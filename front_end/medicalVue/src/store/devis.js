import axios from 'axios'
export default {
    namespaced: true,
    state:{
      devis: [],
      dossier: [],
      user: {},
      profile: {}
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
      },
      getprofile(state){
        return state.profile
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
      },
      setProfile(state, user){
        state.profile = user
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
                    dispatch('order/setorders', null , { root:true })
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
        },
        // Modifier un utilisateur
        async modifyprofile(_, profile){
          return new Promise((resolve, reject) => {
              axios.patch('/info/profile/modify/' + profile.ID, {
                  nom: profile.nom,
                  prenom: profile.prenom,
                  NumSecSocial: profile.NumSecSocial,
                  NumTel: profile.NumTel,
                  Caisse: profile.Caisse,
                  Wilaya: profile.Wilaya,

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
      // recuperer un deul profile
      async setProfile({ commit }, id){
          return new Promise((resolve, reject) => {
              axios.get('/info/getprofile/'+ id )
                .then(response => {
                    commit('setProfile', response.data)
                  resolve(response)
                  // console.log(response)
                })
                .catch(error => {
                  reject(error)
                })
            })
      },
    }
}