<template>
  <div>
    <router-link :to="{ name: 'deck' }">
      <button type="button" class="btn btn-light btn-large btn-block">
        View Decks
      </button>
    </router-link>
    <div class="cardsList">
      <div
        class="cardShadow"
        v-on:click.prevent="toggleDisplayForm"
        v-show="!displayCardForm"
      >
     <!--this is part of the flip card from the method that is commented out 
       <ul class="flashcard-list">
      <li v-on:click="toggleCard(card)" v-for="(card, index) in cards">
        <transition name="flip">
          <p v-bind:key="card.flipped" class="card">
              {{ card.flipped ? card.back : card.front }}
              <span v-on:click="cards.splice(index, 1)" class="delete-card">X</span>
          </p>
        </transition>
      </li>
    </ul> -->
        <div class="plus radius" />
      </div>
      <div class="cardFormCard" v-if="displayCardForm">
        <div class="form-group">
          <div class="cardEditButtons">
             <button class="btn btn-primary" v-on:click="toggleDisplayForm">
              ❌
            </button>
            <button class="btn btn-primary" v-on:click.prevent="addCard">
              ➕
            </button>
           
          </div>

          <label for="cardName" class="cardName"> Card Name </label>
          <input
            type="text"
            class="form-control"
            v-model="newCard.cardTitle"
            required
          />
          <label for="cardText" class="cardText">
            Card Text
          </label>
          <input
            type="text"
            class="form-control"
            v-model="newCard.cardText"
            required
          />
          

        </div>
      </div>
     
      <div v-show="emptyDeck" class="emptydeck">
        <h2>Current Deck is Empty</h2>
      </div>
       <card
        v-for="card in cards"
        v-bind:card="card"
        v-bind:key="card.cardId"
        class="card-iterator"
      />
    </div>
  </div>
</template>

<script>
import flashCardService from "../services/FlashCardService.js";
import Card from "../components/Card.vue";
export default {
  name: "card-list",
  data() {
    return {
      cards: [],
      isDeckEmpty: false,
      displayCardForm: false,
      newCard: {
        cardTitle: '',
        cardText: ''
      }
    };
  },
  components: {
    Card,
  },
  computed: {
    emptyDeck() {
      if (this.cards.length === 0) {
        return true;
      }
      return false;
    },
  },
  methods: {
    toggleDisplayForm() {
      this.displayCardForm = !this.displayCardForm;
    },
    addCard(deckID, card) {
      deckID = this.$route.params.id
      card = this.newCard
      flashCardService.addCard(deckID, card).then((response) => {
        if (response.status === 201) {
          this.$router.go()
        }
      })
    },
    // This may help flip the card
      //  methods: {
      // toggleCard: function(card){
      //   card.flipped = !card.flipped;
      // },
  },

  created() {
    flashCardService.getCardsByDeck(this.$route.params.id).then((response) => {
      this.cards = response.data;
      this.cards = this.cards.reverse();
    });
  },
};
</script>

<style scoped>
.cardsList {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-evenly;
  align-items: center;
}

.card {
}

h2 {
  font-family: Arial, Helvetica, sans-serif;
  text-align: center;
  font-size: 4vmax;
  color: #a7adab49;
  text-shadow: 1px 1px #a7adabf3;
}
.emptydeck {
  display: flex;
  justify-content: center;
  align-items: center;
}
.cardShadow {
  display: flex;
  justify-content: space-around;
  align-items: center;
  flex-wrap: wrap;
  border-radius: 10px;
  height: 300px;
  width: 250px;
  margin: 40px;
  background-color: #131313d0;
  box-shadow: 5px 5px 3px #00000062;
}
.cardFormCard {
  justify-content: space-around;
  align-items: center;
  flex-wrap: wrap;
  border: 5px solid;
  border-color: #0496FF;
  border-radius: 10px;
  height: 300px;
  width: 250px;
  margin: 40px;
  background-color: #FFF4E4;
  box-shadow: 5px 5px 3px #00000062;
}

.cardEditButtons {
  display: flex;
  justify-content: space-between;
}

.btn.btn-primary{
  margin: 5px;
}

.cardFormCard {
  text-align: center;
  padding: 10px;
}

.card-iterator {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
}

.plus {
  /* plus sign on deck shadow */
  display: inline-block;
  width: 100px;
  height: 100px;

  background: linear-gradient(#fff 0 0), linear-gradient(#fff 0 0),
    rgba(0, 0, 0, 0.658);
  background-position: center;
  background-size: 50% 5px, 5px 50%; /*thickness = 2px, length = 50% (25px)*/
  background-repeat: no-repeat;
}

.alt {
  /* plus sign on deck shadow */
  background: linear-gradient(#000 0 0), linear-gradient(#000 0 0);
  background-position: center;
  background-size: 50% 2px, 2px 50%; /*thickness = 2px, length = 50% (25px)*/
  background-repeat: no-repeat;
}
.radius {
  /* plus sign on deck shadow */
  border-radius: 50%;
}
</style>

























