<template>
  <div class="decks">
    <router-link :to="{name:'cardView', params: {id: deck.deckID}}" class="deck" tag="div">
     
     <div class = "editButtons">
    <button type="button" class="btn btn-secondary" v-on:click="deleteDeck" >❌</button>
    <button type="button" class="btn btn-secondary" v-on:click.prevent="toggleDisplayForm">✏️</button>
    </div>

     <div class="titleAndDesc" v-show="!displayForm">
      <h3 class="deck-title"> {{deck.deckTitle}} </h3>
      <p class = "description"> {{deck.deckDescription}} </p>
    </div>
    

    <div v-show="displayForm" class = 'deckFormCard'>      
        <label for="deckName" class="deckName"> Deck Name </label>
          <input type="text" v-on:click.prevent="" class="form-control" v-model="deckToUpdate.deckTitle"/>
        <label for="deckDescription" class="deckDescription"> Deck Description </label>
          <input type="text" v-on:click.prevent="this.deckToUpdate.description" v-model="deckToUpdate.deckDescription" class = "form-control"/>
        <button class="Save btn btn-primary" v-on:click.prevent="updateDeck">Save</button>
        <button class="Save btn btn-danger" v-on:click.prevent="toggleDisplayForm">Cancel</button>
    </div>
    

   <!-- <div
        class="deckShadow"
        v-on:click.prevent="toggleDisplayForm"
        v-show="!displayForm"
      >
        <div class="plus radius" />
      </div> -->
      
  <!-- <div class="deckFormCard">
      <div class="form-group">
        <label for="deckName" class="deckName"> Deck Name </label>
          <input
            type="text"
            class="form-control"
            v-model="deckToUpdate.deckTitle"
            required
        />
        <label for="deckDescription" class="deckDescription">
            Deck Description
        </label>
          <input
            type="text"
            class="form-control"
            v-model="deckToUpdate.deckDescription"
            required
          />
        </div>
      </div> -->




    </router-link>
    
  
    </div>
 

</template>

<script>
import flashCardService from "../services/FlashCardService.js";
export default {
 name: 'Deck',
 
 data(){
   return{
    displayForm: false,
    deleteDeckID: 0,
    deckToUpdate: {
      deckID: 0,
      deckTitle: '',
      deckDescription: '',
    }
   }
 },
 
 props: {
   deck: Object,
 },
 methods: {
   deleteDeck() {
     this.deleteDeckID = this.deck.deckID
     flashCardService.deleteDeck(this.deleteDeckID).then(response => {
       if(response.status === 204) {
         this.$router.push("/decks")

       }
     }) 
   },
   updateDeck() {
     this.deckToUpdate.deckID = this.deck.deckID
     flashCardService.updateDeck(this.deckToUpdate).then(response => {
       if(response.status === 200) {
         this.$router.go()
       }
     })
   },
   toggleDisplayForm() {
      this.displayForm = !this.displayForm;
    }
 },
 components: {
   
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

.deckFormCard {
  text-align: center;
  padding: 10px;
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

.btn {
  margin: 10px;
}


p.description {
  font-family: Arial, Helvetica, sans-serif;
  text-align: center;
}
</style>