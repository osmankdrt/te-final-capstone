<template>
  <div class='cards' v-on:click="showCard">
   <p class="card-title" v-show="!show"> {{card.cardTitle}} </p>
   <p class="card-text" v-show="show"> {{card.cardText}} </p>
  </div>
</template>

<script>

export default {
name:'card',
data() {
  return {
    show: false
  }
},
props: {
  card: Object,
},

methods: {
  showCard(){
    this.show = !this.show;
    return this.show;
  }
},
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
    justify-content: center;
    padding-left: 20;
}
 .card-text{
   text-align: center;
 }
.card-title{
  
  text-align: center;
}



</style>