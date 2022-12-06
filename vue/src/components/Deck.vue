<template>

  <div class = 'decks'>
    <router-link :to="{name:'cardView', params: {id: deck.deckID}}" class="deck" tag="div">
     <h1 class="deck-title"> {{deck.deckTitle}} </h1>
    
     <p class = "description"> {{deck.deckDescription}} </p>
     </router-link>
  </div>

</template>

<script>
export default {
 name: 'Deck',
 props: {
   deck: Object,
 },

 

}
</script>

<style scoped >

.decks{
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    border: 2px solid black;
    border-radius: 10px;
  
    height: 35vh;
    width: 10vw;
}

.deck-title{
  display: flex;
  justify-content: center;
  align-items: center;
}








</style>