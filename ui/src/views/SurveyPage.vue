<template>
  <div class="hello">
    <div class="survey-banner">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12" v-if="step==2">
            <survey :survey="survey"></survey>
            <div class="align-items-center d-flex justify-content-center" v-if="isHomePageButtonVisiable">
              <a class="button" href="/">{{goToHomeText}}</a>
            </div>
          </div>
          <div class="col-lg-12 iq-login-regi" v-if="step==1">
              <div class="align-items-center d-flex justify-content-center iq-login">
                <form class="iq-loginbox">
                  <small class="text-danger" v-if="isStartClicked && !personID">
                    {{requiredText}}
                  </small>
                  <div class="login-boxes mb-3">
                    <input type="text" class="form-control email-bg" id="exampleInputEmail1" :placeholder="placeHolderText" v-model="personID">
                  </div>
                  <button type="submit" class="button" v-on:click="startClicked">{{startButtonText}}</button>
                </form>
              </div>
          </div>
        </div>
      </div>
    </div>
    <div class="main-content">
      <section class="how-it-works conection-shap">
        <div class="container">
          
        </div>
      </section>
    </div>
  </div>
</template>

<script>
import * as SurveyVue from "survey-vue";
import axios from 'axios'
import * as globalConstants from '../globalConstants.js'
import "survey-vue/modern.css";
// import "survey-vue/survey.css";


var Survey = SurveyVue.Survey;
// Survey.cssType = "winterstone";
Survey.cssType = "modern";

SurveyVue.Serializer.addProperty("question", "tag:number");

export default {
  components: {
    Survey
  },
  data() {
    return {
      survey: {

      },
      language: "ja",
      step: 1,
      personID: '',
      validate: false,
      isStartClicked: false,
      isHomePageButtonVisiable: false,
      startButtonText: '開始',
      placeHolderText: 'あなたの身元を入力してください',
      requiredText: 'あなたの身元が必要です',
      goToHomeText: 'ホームページへ',
      savingMsg: '結果はサーバーに保存されています...',
      successMsg: '結果は正常に保存されました！',
      failedMsg: 'エラーが発生したため、結果を保存できませんでした。',
      surveyResult: {
        person_id: "",
        survey_id: "",
        answers: {

        }
      },
      surveyId: this.$route.params.survey_id,
    };
  },
  created () {
    // console.log('survey')
    // this.$store.commit('setIsLoading', true);
    this.setLanguage(this.$store.state.siteLanguage);
    axios.get(globalConstants.apiURL+'/surveyForSurveyJS/'+this.surveyId)
      .then(response => {
        this.survey = new SurveyVue.Model(response.data);
        this.survey.locale = this.$store.state.siteLanguage;
        this.addOnComplete();
        // this.$store.commit('setIsLoading', false);
        // console.log('survey 1', this.survey)
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
    }
  },
  methods: {
    startClicked(event){
      event.preventDefault();
      this.isStartClicked = true;
      if(this.personID){
        this.step = 2;
      }
    },
    addOnComplete(){
      this.survey.onComplete.add((survey, options) => {
        options.showDataSaving(this.savingMsg);
        this.surveyResult.person_id = this.personID;
        this.surveyResult.survey_id = this.surveyId;
        this.surveyResult.answers = survey.data;
        axios.post(globalConstants.apiURL+'/userSurvey', this.surveyResult)
        .then(response => {
          options.showDataSavingSuccess(this.successMsg);
          this.isHomePageButtonVisiable = true;
        })
        .catch(error => {
          options.showDataSavingError(this.failedMsg);
          console.log(error)
        })
      })
    },
    setLanguage(siteLanguage){
      this.survey.locale = siteLanguage
      if(siteLanguage==="ja"){
        this.startButtonText = "開始";
        this.placeHolderText = "あなたの身元を入力してください";
        this.requiredText = 'あなたの身元が必要です';
        this.goToHomeText = 'ホームページへ';
        this.savingMsg = '結果はサーバーに保存されています...';
        this.successMsg = '結果は正常に保存されました！';
        this.failedMsg = 'エラーが発生したため、結果を保存できませんでした。';
      }
      else{
        this.startButtonText = 'Start';
        this.placeHolderText = 'Please enter your ID';
        this.requiredText = 'Your ID is required';
        this.goToHomeText = 'Go to Home Page';
        this.savingMsg = 'The results are saving on the server...';
        this.successMsg = 'The results were saved successfully!';
        this.failedMsg = 'An error occurred and we could not save the results.';
      }
    }
  }
};
</script>

<style scoped>
.survey-banner {
  padding: 150px 90px 65px 90px;
}
</style>

<style lang="scss">
.iq-login-regi {
  padding: 0px;
  .iq-login {
    border: none;
  }
}
.progress-bar {
  background-color: #28a745;
}
.progress {
  width: 100% !important;
  height: 1.5rem !important;
  background-color: #E0E0E0;
}
.panel-footer {
  display: flex;
  justify-content: space-between;
  .sv_prev_btn {
    background-color: #f0831e;
    color: #fff;
  }
  .sv_next_btn {
    background-color: #28a745;
    color: #fff;
  }
  .sv_complete_btn {
    background-color: #28a745;
    color: #fff;
  }
}
</style>
