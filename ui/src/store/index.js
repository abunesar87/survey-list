import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    isLoading: false,
  	siteLanguage: 'ja'
  },
  mutations: {
    setIsLoading (state, val) {
      state.isLoading = val
    },
  	setSiteLanguage (state, val) {
      state.siteLanguage = val
    },
  },
  actions: {
  },
  modules: {
  }
})