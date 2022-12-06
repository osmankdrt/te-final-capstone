<template>

  <div >
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

.deck{
    display: flex;
    justify-content: space-around;
    border: 2px solid black;
    border-radius: 10px;
    margin: 20px;
}









</style>