<template>

  <div class="decks">
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
    /* display: flex; */
    justify-content: space-around;
    align-items: center;
    border: 2px solid black;
    border-radius: 10px;
    width: 10vw;
    margin: 40px;
}

p.description{
  display: none;
}

.deck-title:hover + .description {
  display: block;
  color: gray;
}









</style>