<template>
  <div id="app">
    <app-header class = 'appheader'>
    </app-header>
     <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'deck' }">Decks</router-link>&nbsp;|&nbsp;
     <router-link v-bind:to="{name: 'login'}" v-show="$store.state.token == ''">Login</router-link>
    <router-link v-bind:to="{name: 'logout'}" v-show="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view class = 'routerview'>
    </router-view>
    <app-footer class = 'appfooter'>
     
    </app-footer>
   
  </div>
</template>
<script>
import AppHeader from './components/AppHeader.vue'
import AppFooter from './components/AppFooter.vue'
export default {
  name: 'App',
  components: {
   AppHeader,
   AppFooter
  }
}
</script>

<style>
#app {
  /* width: 100%;
  height:100vh;
  display: flex; */
  /* background-color: blue; */
 width: 100%;
  height:100vh;

  /* grid-template-areas:
  "header" "header" "header"
  "routerview" "routerview" "routerview"
  "routerview" "routerview" "routerview"
  "footer" "footer" "footer" */
}


/* .appheader {
  grid-area: header;
  grid-row: 50%;

}

.routerview {
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  grid-area: routerview;
  background-color: #285943;
}
.appfooter {
  grid-area: footer
  
}
*/

#nav{
  display: flex;
  justify-content: flex-end;
 padding: 10px;
}
.routerview {
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  /* grid-area: routerview; */
  background-color: #285943;
  height: 85vh;
}
 
</style>