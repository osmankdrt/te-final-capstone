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
    width: 300px;
    height: 400px;
    flex-wrap: wrap;
    display: flex;
    margin: 20px;
    
    
}
 .card-text{
 
 }
.card-title{

}



</style>