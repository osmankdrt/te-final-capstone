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
    width: 30vw;
    height: 20vh;
    flex-wrap: wrap;
    display: flex;
    margin: 20px;
    
}
 .card-text{
 position:relative;
left:-50px;
top:43px;
 }
.card-title{
  position:relative;
left:28px;
top:-5px;
}



</style>