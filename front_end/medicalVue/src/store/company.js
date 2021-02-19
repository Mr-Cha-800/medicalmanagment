import axios from 'axios'
export default {
    namespaced: true,
    state:{
        info: {},
        users: {}
    },
    getters:{
        getinfo(state){
            return state.info
        },
        getusers(state){
            return state.users
        }
    },
    mutations:{
        updateinfo(state, info){
            state.info = info
        },
        setinfo(state, info){
            state.info = info
        },
        setusers(state, users){
            state.users = users
        }
    },     
    actions:{
        async modifyinfo({ commit }, info){
            return new Promise((resolve, reject) => {
                axios.patch('/info/modify', {
                    NumRegistreComm: info.NumRegistreComm,
                    NumArtImp: info.NumArtImp,
                    NumIdFisc: info.NumIdFisc,
                    Tva: info.Tva,
                    TelOne: info.TelOne,
                    TelTwo: info.TelTwo,
                    Id: 1
                })
                  .then(response => {
                    resolve(response)
                    commit('updateinfo', response.data)
                    // console.log(response)
                  })
                  .catch(error => {
                    reject(error)
                  })
              })
        },
        async setinfo({ commit }){
            return new Promise((resolve, reject) => {
                axios.get('/info')
                  .then(response => {
                      commit('setinfo', response.data)
                    resolve(response)
                    // console.log(response)
                  })
                  .catch(error => {
                    reject(error)
                  })
              })
        },
        async setusers({ commit }){
            return new Promise((resolve, reject) => {
                axios.get('/info/getusers')
                  .then(response => {
                      commit('setusers', response.data)
                    resolve(response)
                    // console.log(response)
                  })
                  .catch(error => {
                    reject(error)
                  })
              })
        },
        async savedatabase(_, chemin){
            return new Promise((resolve, reject) => {
                axios.post('/info/save', {
                    chemin: chemin
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