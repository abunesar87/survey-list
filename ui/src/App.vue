<template>
  <div id="app">
    <Navbar />
    <div v-if="$store.state.isLoading">
      <Loader/>
    </div>
    <div v-if="!$store.state.isLoading">
      <router-view/>
    </div>
    <Footer />
  </div>
</template>

<script>
export default {
  components: {
    Navbar: () => import('@/components/Navbar.vue'),
    Footer: () => import('@/components/Footerbar.vue'),
    Loader: () => import('@/components/Loader.vue')
  }
}
</script>

<style lang="scss">
@import "assets/scss/custom.scss";

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}
</style>
