<template>
  <div class="decks">
    <router-link :to="{name:'cardView', params: {id: deck.deckID}}" class="deck" tag="div">
     <h3 class="deck-title"> {{deck.deckTitle}} </h3>
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
    
    justify-content: space-around;
    align-items: center;
    flex-wrap: wrap;
    border: 5px solid;
    border-color: #D7FFF1;
    border-radius: 10px;
    height: 300px;
    width: 250px;
    margin: 40px;
    background-color: #77AF9C;
    box-shadow: 15px 15px 3px  #00000062;
    
}

p.description{
  display: none;
  padding: 5px;
}

div.deck:hover p.description {
  display: block;
  color: #285943;
  text-align: center;

}

h3.deck-title {
  font-family: Arial, Helvetica, sans-serif;
  padding: 20px;
  text-align: center;
  color: #285943;
  text-shadow: 1px 1px #00000041;
  font-weight: bold;
  


}


p.description {
  font-family: Arial, Helvetica, sans-serif;
  text-align: center;
}
</style>