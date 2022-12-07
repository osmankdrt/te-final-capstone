<template>
    <div>
        <router-link :to ="{name: 'deck'}">
        <button type="button" class ="btn btn-light btn-large btn-block">  View Decks
        </button>
        </router-link>
  <div class ="cardsList">
  <card v-for="card in cards" v-bind:card="card" v-bind:key="card.cardId" class = 'card'/>
  <div v-show="emptyDeck" class ='emptydeck'>
      <h2> Current Deck is Empty</h2>
  </div>
  </div>
  </div>
  
</template>

<script>
import flashCardService from '../services/FlashCardService.js'
import Card from '../components/Card.vue'
export default {
    name: 'card-list',
    data() {
        return{
            cards: [],
            isDeckEmpty: false
        }
    },
    components: {
        Card
    },
    computed: {
       emptyDeck() {
           if(this.cards.length === 0) {
               return true
           } return false
       }
    },
    created() {
        flashCardService.getCardsByDeck(this.$route.params.id).then( (response) => {
         this.cards = response.data;
       });
    }

}
</script>

<style scoped>
.cardsList{
    display: flex;  
    justify-content: center;
    flex-wrap: wrap;
    
    
}

.card{
    
}

h2 {
    font-family: Arial, Helvetica, sans-serif;
    text-align: center;
    font-size: 4vmax;
    color: #a7adab49;
    text-shadow: 1px 1px #a7adabf3;

}
.emptydeck{
    display: flex;
    justify-content: center;
    align-items: center;
    
}

</style>

























