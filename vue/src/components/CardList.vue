<template>
  <div class ="cardsList">
  <card v-for="card in cards" v-bind:card="card" v-bind:key="card.cardId" class = 'card'/>
  </div>
</template>

<script>
import flashCardService from '../services/FlashCardService.js'
import Card from '../components/Card.vue'
export default {
    name: 'card-list',
    data() {
        return{
            cards: []
        }
    },
    components: {
        Card
    },
    computed: {
        // cards() {
        //     const activeDeck = this.$store.getters.card;
        //     return activeDeck.cards;
        // }
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

</style>

























