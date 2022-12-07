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
    flex-wrap: wrap;
    border: 2px solid black;
    border-radius: 10px;
    height: 300px;
    width: 250px;
    margin: 40px;
}

p.description{
  display: none;
}

h1.deck-title:hover + p.description {
  display: block;
  color: gray;

}

h1.deck-title {
  text-align: center;
  
}


p.description {
  text-align: center;
}
</style>