<template>
  <div class = 'deck'>
    <deck v-for="deck in decks" v-bind:deck="deck" v-bind:key="deck.deckId"/>
    
  </div>
</template>

<script>
import Deck from '../components/Deck.vue'
import flashCardService from '../services/FlashCardService.js'

export default {
 name: 'deck-list',
 data() {
   return {
     id: 0,
     decks: []
   }
 },
 props: {
   deck: Object,
 },
 components: {
    Deck
 },
 computed: {
    //  filteredDecks() {
    //      return this.$store.state.decks;
    //  },
 },
 created() {
       flashCardService.listDecks().then( (response) => {
         this.decks = response.data;
       });
  },
}
</script>

<style scoped>
.deck{
  display:flex;
  justify-content: space-evenly;
  align-items: center;
  height: 15vh;
  margin:2%;
  
  flex-wrap: wrap;
   
}
</style>