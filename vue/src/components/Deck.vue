<template>
  <div>
     <h1 class="deck-title"> {{deck.title}} </h1>
     <p class = "description"> {{deck.description}} </p>

  </div>
</template>

<script>
export default {
 name: 'Deck',
 props: {
   deck: Object,
 }

}
</script>

<style>

</style>