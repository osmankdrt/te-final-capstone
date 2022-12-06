<template>
  <div class='deck'>
     <h1 class="deck-title"> {{deck.deckTitle}} </h1>
     <p class = "description"> {{deck.deckDescription}} </p>
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
    border: 2px solid black;
    border-radius: 10px;
    width: 30vw;
    height: 20vh;
    margin: 20px;
}









</style>