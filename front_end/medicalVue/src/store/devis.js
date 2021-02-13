import axios from 'axios'
export default {
    namespaced: true,
    state:{
      devis: [],
      devisberk: [],
      dossier: [],
      user: {},
      profile: {}
    },
    getters:{
      getalldevis(state){
        return state.devis
      },
      getalldevisberk(state){
        return state.devisberk
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
      setalldevisberk(state,devis){
        state.devisberk = devis
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
      // recuperer tous les devis cash
      async setdevisberk({ commit }){
          return new Promise((resolve, reject) => {
              axios.get('/factures/devis/cash')
                .then(response => {
                    commit('setalldevisberk', response.data)
                  resolve(response)
                  // console.log(response)
                })
                .catch(error => {
                  reject(error)
                })
            })
      },
      // supprimer un devis
        async deletedevis({dispatch},payload){
            return new Promise((resolve, reject) => {
                axios.delete('/factures/devis/'+ payload.id+'/'+ payload.caisse)
                  .then(response => {
                    if(payload.caisse === 'CASH'){
                      dispatch('setdevisberk')
                    }else{
                      dispatch('setdevis')

                    }
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
                  axios.post('/factures/recherche/devisberk', {
                  Search : search
                })
                  .then(response => {
                    commit('setalldevisberk', response.data)
                    resolve(response)
                    // console.log(response)
                  })
                  .catch(error => {
                    reject(error)
                  })
              })
        },
        // chercher un devis
        async searchdevisberk({ commit }, search){
          search = '%'+search+'%'
            return new Promise((resolve, reject) => {
                axios.post('/factures/recherche/devisberk', {
                  Search : search
                })
                  .then(response => {
                    commit('setalldevisberk', response.data)
                    resolve(response)
                    // console.log(response)
                  })
                  .catch(error => {
                    reject(error)
                  })
              })
        },
        // finaliser un devis
        async finaliserdevis({ dispatch }, order){
            return new Promise((resolve, reject) => {
                axios.patch('/factures/finaliser', {
                    Id: order.Id,
                    ID_seyed:  order.ID_seyed,
                    Nom_Prenom: order.Nom_Prenom,
                    caisse: order.caisse,
                    date_delivery: order.date_delivery
                })
                  .then(response => {
                    if(order.caisse === 'CASH'){
                      dispatch('setdevisberk')
                    }else{
                      dispatch('setdevis')}
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