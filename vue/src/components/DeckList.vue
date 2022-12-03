<template>
  <div>
    <deck v-for="deck in decks" v-bind:deck="deck" v-bind:key="deck.id"/>
  </div>
</template>

<script>
import Deck from '../components/Deck.vue'
export default {
 name: 'deck-list',
 components: {
    Deck
 },
 computed: {
     decks() {
         return this.$store.state.decks;
     }
 }
}
</script>

<style>

</style>