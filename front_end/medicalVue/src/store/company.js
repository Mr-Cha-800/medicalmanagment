import axios from 'axios'
export default {
    namespaced: true,
    state:{
        info: {}
    },
    getters:{
        getinfo(state){
            return state.info
        }
    },
    mutations:{
        updateinfo(state, info){
            state.info = info
        },
        setinfo(state, info){
            state.info = info
        }
    },     
    actions:{
        async modifyinfo({ commit }, info){
            return new Promise((resolve, reject) => {
                axios.patch('/info/modify', {
                    NumRegistreComm: info.NumRegistreComm,
                    NumArtImp: info.NumArtImp,
                    NumIdFisc: info.NumIdFisc,
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
        }
    }
}