<template>
  <div class="decks">
    
    <router-link :to="{name:'cardView', params: {id: deck.deckID}}" class="deck" tag="div">
      <div class = "editButtons">
     <button type="button" class="btn btn-secondary" v-on:click="deleteDeck">❌</button>
    </div>
     <h3 class="deck-title"> {{deck.deckTitle}} </h3>
     <p class = "description"> {{deck.deckDescription}} </p>
      </router-link>
  </div>
 

</template>

<script>
import flashCardService from "../services/FlashCardService.js";
export default {
 name: 'Deck',
 deleteDeckID: 0,
 props: {
   deck: Object,
 },
 methods: {
   deleteDeck() {
     this.deleteDeckID = this.deck.deckID
     flashCardService.deleteDeck(this.deleteDeckID).then(response => {
       if(response.status === 204) {
         this.$router.go()

       }
     }) 
   }
 }
}
</script>

<style scoped >

.deck{
    
    align-items: center;
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