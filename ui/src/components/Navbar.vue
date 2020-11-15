<template>
  <header>
    <div class="container-fluid sub-header">
      <div class="row">
        <div class="col-auto mr-auto">
          <div class="btn-group">
            <select v-model="language" @change="onChange($event)">
              <option value="ja">日本語</option>
              <option value="en">English</option>
            </select>
          </div>
        </div>
      </div>
    </div>
    <div class="container-fluid main-header">
      <div class="row">
        <div class="col-sm-12">
          <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="/">
              <img src="../assets/images/logo.png" class="img-fluid logo" alt="img">
            </a>
          </nav>
        </div>
      </div>
    </div>
  </header>
</template>

<script>
export default {
  name: 'Navbar',
  data() {
    return {
      language: "ja"
    };
  },
  methods: {
    onChange(event) {
      this.$store.commit('setSiteLanguage', this.language)
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
</style>
