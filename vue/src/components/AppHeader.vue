<template>
  <div class= "header">
     <img id="logo" src="../assets/R.png" alt="Globel Logo">
      <h1>Lango cards</h1>
     <nav id= "nav">
        <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'deck' }">Decks</router-link>&nbsp;|&nbsp;
    <router-link class = "login" v-bind:to="{name: 'login'}" v-show="$store.state.token == ''">Login</router-link>
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
  
}
 #logo{
   height: 65px;
   flex-grow: 20px;

 } 

#nav{
  display: flex;
  justify-content: space-around;
}

</style>