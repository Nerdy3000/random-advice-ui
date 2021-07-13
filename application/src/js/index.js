import Vue from 'vue';
import App from './components/App.vue'
import '../sass/style.scss';

const app = {
  el: '#app',
  render: h => h( App )
};

new Vue( app );