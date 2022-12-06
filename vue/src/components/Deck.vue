<template>
  <div>
     <h1 class="deck-title"> {{deck.deckTitle}} </h1>
     <p class = "description"> {{deck.deckDescription}} </p>

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

<style>

</style>