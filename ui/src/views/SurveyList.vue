<template>
  <div class="surveyList">
    <div class="banner">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-12">
            <div v-for="survey in surveyResult" :key="survey.survey_id">
              <div class="banner-text">
                <h3 v-if="language == 'ja'">{{survey.title.ja}}</h3>
                <h3 v-else>{{survey.title.default}}</h3>
                <div class="align-items-center d-flex justify-content-center">
                  <router-link class="button" :to="'/surveys/' + survey.survey_id">
                    {{buttonText}}
                  </router-link>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import axios from 'axios'
import * as globalConstants from '../globalConstants.js'


export default {
  name: 'SurveyList',
  data () {
    return {
      surveyResult: {

      },
      buttonText: '始めましょう',
      language: this.$store.state.siteLanguage
    }
  },
  created () {
    this.setLanguage(this.$store.state.siteLanguage);

    axios.get(globalConstants.apiURL+'/surveys')
      .then(response => {
        this.surveyResult = response.data.surveys;
        // this.surveyResult.locale = this.$store.state.siteLanguage;
        // console.log('survey list', JSON.stringify(this.surveyResult))
        
      })
      .catch(error => {
        // console.log(error)
      })
      .finally(()=>{
        
    })
  },
  computed: {
    SiteLanguage () {
      return this.$store.state.siteLanguage
    }
  },
  watch: {
    SiteLanguage (newSiteLanguage, oldSiteLanguage) {
      this.setLanguage(newSiteLanguage);
      this.language = newSiteLanguage;
    }
  },
  methods: {
    setLanguage(siteLanguage){
      if(siteLanguage==="ja"){
        this.buttonText = '始めましょう';
      }
      else{
        this.buttonText = 'Get Started';
      }
    }
  }
}
</script>

<style scoped lang="scss">
.surveyList {
  position: relative;
}
.banner {
  height: 100vh;
}
.banner-text {
  padding-top: 0px;
  text-align: center;
}
</style>

