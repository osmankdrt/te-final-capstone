<template>
  <div class= "header">
      <h1>Shady Steve's FlashCard App</h1>
     <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'deck' }">Decks</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
  </div>

</template>

<script>
export default {
 name: 'app-header'
}
</script>

<style scoped>
body {
  margin: 0 auto;
}

.header{
 width: 100%;
 background-color: #8CD790;
 margin: 0 auto;
 padding:20px;
  
}
h1{
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
  color: #77AF9C;
  text-shadow: 1px 1px rgba(0, 0, 0, 0.466);

    
  }
  #nav{
   
  }




</style>