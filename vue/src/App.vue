<template>
  <div id="app">
    <app-header />
    <router-view class = "routerview"/>
    <app-footer />
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

 .appheader {
 display: flex;

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