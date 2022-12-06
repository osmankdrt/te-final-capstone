<template>
  <div class="decks">
    <article class ="deck">
     <h1 class="deck-title"> {{deck.title}} </h1>
     </article>
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

<style scoped >

.deck{
    border: 2px solid black;
    border-radius: 10px;
    width: 350px;
    height: 200px;
    margin: 20px;
}









</style>