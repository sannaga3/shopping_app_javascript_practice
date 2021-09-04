import Vue from 'vue/dist/vue.esm.js'
import MoneyList from '../MoneyList.vue'

document.addEventListener('DOMContentLoaded', () => {
  var app = new Vue({
    el: '#money_list',
    components: { 'money-list': MoneyList }
  })
})