<template>
  <div>
  <card v-for="card in cards" v-bind:card="card" v-bind:key="card.id" />
  </div>
</template>

<script>
import Card from '../components/Card.vue'
export default {
    name: 'card-list',
    components: {
        Card
    },
    computed: {
        cards() {
            const activeDeck = this.$store.getters.card;
            return activeDeck.cards;
        }
    }

}
</script>

<style>

</style>