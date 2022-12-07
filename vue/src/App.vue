<template>
  <div id="app">
    <app-header class = 'appheader'>
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <!-- <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link> -->
    </div>
    </app-header>
    
    <router-view class = 'routerview'/>
    <app-footer class = 'appfooter' />
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
body {
  margin: 0 auto;
}

#app {
  width: 100%;
  height:100vh;
  display: grid;
  grid-template-areas:
  "header" "header" "header"
  "routerview" "routerview" "routerview"
  "routerview" "routerview" "routerview"
  "routerview" "routerview" "routerview"
  "footer" "footer" "footer"

}

.appheader {
  grid-area: header;

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
</style>