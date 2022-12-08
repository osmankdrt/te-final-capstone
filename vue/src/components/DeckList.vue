<template>
  <div>
    <div class = 'deckList'>
      <deck v-for="deck in decks" v-bind:deck="deck" v-bind:key="deck.deckId"/> 
      <div class = 'deckShadow' v-on:click.prevent="toggleDisplayForm" v-if="!displayForm">
        <div class = 'plus radius'/>
      </div>
    <div class = 'deckFormCard' v-on:click.prevent="toggleDisplayForm" v-if="displayForm">
      <div class = 'form-group'>
        <label for="deckName" class="deckName"> Deck Name </label>
        <input type="text" class ="form-control">
         <label for="deckDescription" class="deckDescription"> Deck Description </label>
        <input type="text" class ="form-control">

      </div>
    </div>
    
    
    </div>
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
     decks: [],
     displayForm: false
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
 methods: {
   toggleDisplayForm() {
     this.displayForm = ! this.displayForm
   }
 },
 created() {
       flashCardService.listDecks().then( (response) => {
         this.decks = response.data;
       });
  },
}
</script>

<style scoped>
.deckList{
  display:flex;
  flex-wrap: wrap;
  justify-content: space-evenly;
  align-items: center;
}
.deckShadow{
  display: flex;
  justify-content: space-around;
  align-items: center;
  flex-wrap: wrap;
  border-radius: 10px;
  height: 300px;
  width: 250px;
  margin: 40px;
  background-color: #131313d0;
}
.deckFormCard{
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
.deckName {
  font-family: Arial, Helvetica, sans-serif;
  padding: 20px;
  text-align: center;
  color: #285943;
  text-shadow: 1px 1px #00000041;
  font-weight: bold;
}

.deckDescription {
  font-family: Arial, Helvetica, sans-serif;
  text-align: center;
}

.deckFormCard{
  text-align: center;
  padding: 10px;
}

.plus {
  /* plus sign on deck shadow */
  display:inline-block;
  width:100px;
  height:100px;
  
  background:
    linear-gradient(#fff 0 0),
    linear-gradient(#fff 0 0),
    rgba(0, 0, 0, 0.658);
  background-position:center;
  background-size: 50% 5px,5px 50%; /*thickness = 2px, length = 50% (25px)*/
  background-repeat:no-repeat;
}

.alt {
  /* plus sign on deck shadow */
  background:
    linear-gradient(#000 0 0),
    linear-gradient(#000 0 0);
  background-position:center;
  background-size: 50% 2px,2px 50%; /*thickness = 2px, length = 50% (25px)*/
  background-repeat:no-repeat;
}
.radius {
  /* plus sign on deck shadow */
  border-radius:50%;
}
</style>