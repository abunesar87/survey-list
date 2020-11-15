<template>
  <div class="hello">
    <div class="banner">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-12">
            <div class="banner-text">
              <h1 class="font-weight-bold  mb-3">{{headerText}}</h1>
              <div class="align-items-center d-flex justify-content-center">
                <!-- <a class="button" href="/survey">{{buttonText}}</a> -->
                <a class="button" href="/survey-list">{{buttonText}}</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'StartView',
  data() {
    return {
      headerText: 'このアンケートにご記入ください',
      buttonText: '始めましょう'
    };
  },
  created () {
    this.setLanguage(this.$store.state.siteLanguage);
  },
  computed: {
    SiteLanguage () {
      return this.$store.state.siteLanguage
    }
  },
  watch: {
    SiteLanguage (newSiteLanguage, oldSiteLanguage) {
      this.setLanguage(newSiteLanguage);
    }
  },
  methods: {
    setLanguage(siteLanguage){
      if(siteLanguage==="ja"){
        this.headerText = 'このアンケートにご記入ください';
        this.buttonText = '始めましょう';
      }
      else{
        this.headerText = 'Please complete this survey';
        this.buttonText = 'Get Started';
      }
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.banner {
  height: 100vh;
}
.banner-text {
  padding-top: 0px;
  text-align: center;
}
</style>
