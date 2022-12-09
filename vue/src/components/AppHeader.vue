<template>
  <div class= "header">
     <img id="logo" src="../assets/R.png" alt="Globel Logo">
      <h1>Lango </h1>
      <nav class = "nav">
        <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'deck' }">Decks</router-link>&nbsp;|&nbsp;
     <router-link v-bind:to="{name: 'login'}" v-show="$store.state.token == ''">Login</router-link>
    <router-link v-bind:to="{name: 'logout'}" v-show="$store.state.token != ''">Logout</router-link>
   </nav>
  </div>
 

</template>

<script>
export default {
 name: 'app-header'
}
</script>

<style scoped>
 .header{
  display: flex;
  background-color: #CDD5D1;
}
 #logo{
   height: 65px;
   flex-grow: 20px;
   
 } 
.nav{
  display: flex;
 align-content: center;
 text-align: end;
}

h1{
  font-family: 'Times New Roman', Times, serif;
 color: #043152;
}


</style>