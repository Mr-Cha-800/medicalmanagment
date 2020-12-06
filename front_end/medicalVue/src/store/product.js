import axios from 'axios'
export default {
    namespaced: true,
    state:{
        order: {},
        product: {},
        products: []
    },
    getters:{
        showoneproduct(state){
            return state.product
        },
        getproducts(state){
            return state.products
        }
    },
    mutations:{
        showproduct(state, product){
            state.product = product
        },
        getallproducts(state, products){
            state.products = products
        }
    },
    actions:{
        async newproduct(_, product){
            return new Promise((resolve, reject) => {
                axios.post('/produits', {
                    NumRef: product.refId,
                    Designation: product.nomProduit,
                    PrixU: product.montantProduit
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
        async getallproducts({ commit }){
            return new Promise((resolve, reject) => {
                axios.get('/produits')
                  .then(response => {
                      commit('getallproducts', response.data)
                    resolve(response)
                    // console.log(response)
                  })
                  .catch(error => {
                    reject(error)
                  })
              })
        },
        async showproduct({ commit }, id){
            return new Promise((resolve, reject) => {
                axios.get('/produits/'+ id)
                  .then(response => {
                      commit('showproduct', response.data)
                    resolve(response)
                    // console.log(response)
                  })
                  .catch(error => {
                    reject(error)
                  })
              })
        },
        async modifyproduct(_, product){
            return new Promise((resolve, reject) => {
                axios.patch('/produits', {
                    NumRef: product.Ref,
                    Designation: product.nomProduit,
                    PrixU: product.montantProduit
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
        async deleteproduct({ dispatch }, id){
            return new Promise((resolve, reject) => {
                axios.delete('/produits', {
                    NumRef: id,
                })
                  .then(response => {
                      dispatch('getproducts')
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