<template>
  <div id="app">
    <app-header class = "header"/>
    <router-view class = "routerview"/>
    <!-- <app-public class = "publicDeck"/> -->
    
    <app-footer />
  </div>
</template>
<script>
import AppHeader from './components/AppHeader.vue'
import AppFooter from './components/AppFooter.vue'

// import AppPublic from './components/AppPublic.vue'
export default {
  name: 'App',
  components: {
   AppHeader,
   AppFooter
  
  //  AppPublic
  }
}
</script>

<style>
#app {
 width: 100%;
  height:100vh;
  background-color: #2a6853;
  grid-template-areas:
  "header" "header" "header"
  "routerview" "routerview" "routerview"
  "routerview" "routerview" "routerview"q
  "footer" "footer" "footer"
}


.appheader {
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

.publicDeck{
  display: flex;
  justify-content: center;
}

.appfooter {
   background-color: #FFF4E4;  
   grid-area: footer;
}

</style>