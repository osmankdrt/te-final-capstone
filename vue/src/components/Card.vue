<template>
  <div class="cards">
         <div class = "cardEditButtons">
    <button type="button" class="btn btn-primary" v-on:click.prevent="deleteCard">❌</button>
    <button type="button" class="btn btn-primary" v-on:click.prevent="toggleDisplayForm">✏️</button>
          </div>
    <div class="flip-card" v-on:click.prevent="showCard">
    <div class="inner-card">
      <div class="front-card">
     
        <p class="card-title" v-show="!show">{{ card.cardTitle }}</p>
        <p class="card-tags" v-show="!show">{{ card.tags }}</p>
      </div>
      <div class="back-card" >
        <p class="card-text" v-show="show">{{ card.cardText }}</p>
      </div>
      <div v-show="displayCardForm" class = 'cardFormCard'>      
        <label for="cardName" class="cardName"> Card Name </label>
          <input type="text" v-on:click.prevent="" class="form-control" v-model="cardToUpdate.cardTitle"/>
        <label for="cardText" class="cardText"> Card Text </label>
          <input type="text"  v-model="cardToUpdate.cardText" class = "form-control"/>
        <button class="Save btn btn-primary" v-on:click.prevent="updateCard">Save</button>
        <button class="Cancel btn btn-danger" v-on:click.prevent="toggleDisplayForm">Cancel</button>
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
      displayCardForm: false,
      cardToDeleteID: 0,
      cardToUpdate: {
        cardID: 0,
        cardTitle: '',
        cardText:'',
        tags: ''
      }
    };
  },
  props: {
    card: Object,
  },

  methods: {
    showCard() {
      this.show = !this.show;
    },
    toggleDisplayForm() {
      this.displayCardForm = !this.displayCardForm;
    },
    deleteCard() {
     this.cardToDeleteID = this.card.cardID
      flashCardService.deleteCard(this.cardToDeleteID).then(response => {
        if (response.status === 204) {
          this.$router.go()
        }
      })
    },
    updateCard() {
      this.cardToUpdate.cardID = this.card.cardID
      flashCardService.updateCard(this.cardToUpdate).then(response => {
        if(response.status === 200) {
          this.$router.go()
        }
      })
    }
  },
 
};
</script>

<style scoped>

.cards {
  align-content: center;
  border: 5px solid;
  border-color: #0496FF;
  border-radius: 10px;
  height: 300px;
  width: 250px;
  margin: 40px;
  background-color: #fff4e4;
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
  color: #0496FF;
  padding: 5px;
  font-size: 3vh;
  overflow-y: auto;
}
.card-title {
  font-family: Arial, Helvetica, sans-serif;
  text-align: center;
  padding: 5px;
  color: #0496FF;
  text-shadow: 1px 1px #00000041;
  font-weight: bold;
  font-size: 3vh;
}

.cardFormCard {
  text-align: center;
  padding: 10px;
}


.cardEditButtons{
  display: flex;
  justify-content:space-between
}

.btn.btn-primary{
  margin: 10px;
}






</style>