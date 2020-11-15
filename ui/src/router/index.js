import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

  const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/survey-list',
    name: 'Survey-list',
    component: () => import('../views/SurveyList.vue')
  },
  {
    path: '/surveys/:survey_id',
    name: 'Surveys',
    component: () => import('../views/SurveyPage.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  routes
})

export default router
