<template>
  <div class='cards'>
   <p class="card-title"> {{card.cardTitle}} </p>
   <p class="card-text"> {{card.cardText}} </p>
  </div>
</template>

<script>

export default {
name:'card',
props: {
  card: Object,
}
}
</script>

<style scoped>

.cards{
   border: 2px solid black;
    border-radius: 10px;
    width: 350px;
    height: 200px;
    margin: 20px;
}






</style>