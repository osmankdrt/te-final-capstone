<template>
  <div class="cards">
         <div class = "editButtons">
    <button type="button" class="btn btn-secondary" v-on:click.prevent="deleteCard">❌</button>
    <button type="button" class="btn btn-secondary">✏️</button>
          </div>
    <div class="flip-card" v-on:click.prevent="showCard" >
    <div class="inner-card">
      <div class="front-card">
     
        <p class="card-title" v-show="!show">{{ card.cardTitle }}</p>
      </div>
      <div class="back-card">
        <p class="card-text" v-show="show">{{ card.cardText }}</p>
      </div>
      
    </div>
    </div>
  </div>
 
</template>

<script>
import flashCardService from "../services/FlashCardService.js";
export default {
  name: "card",
  data() {
    return {
      show: false,
      cardToDeleteID: 0
    };
  },
  props: {
    card: Object,
  },

  methods: {
    showCard() {
      this.show = !this.show;
    },
    deleteCard() {
     this.cardToDeleteID = this.card.cardID
      flashCardService.deleteCard(this.cardToDeleteID).then(response => {
        if (response.status === 204) {
          this.$router.go()
        }
      } )
    }
  },
 
};
</script>

<style scoped>

.cards {
  justify-content: space-around;
  align-items: center;
  flex-wrap: wrap;
  border: 5px solid;
  border-color: #d7fff1;
  border-radius: 10px;
  height: 300px;
  width: 250px;
  margin: 40px;
  background-color: #77af9c;
  box-shadow: 5px 5px 3px #00000062;
  overflow-y: auto;
}

/* .cards{
   border: 2px solid black;
    border-radius: 10px;
    width: 300px;
    height: 400px;
    flex-wrap: wrap;
    display: flex;
    margin: 20px;
    justify-content: center;
    padding-left: 20;
} */

p.card-text{
  text-align: center;
  color: #285943;
  padding: 5px;
  overflow-y: auto;
}
.card-title {
  font-family: Arial, Helvetica, sans-serif;
  text-align: center;
  padding: 10px;
  color: #285943;
  text-shadow: 1px 1px #00000041;
  font-weight: bold;
}

.btn {
  margin: 10px;
}


</style>