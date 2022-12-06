<template>
  <div>
  <card v-for="card in cards" v-bind:card="card" v-bind:key="card.cardId" />
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
        flashCardService.getCardsByDeck(this.$route.params.deckId).then( (response) => {
         this.cards = response.data;
       });
    }

}
</script>

<style scoped>























</style>