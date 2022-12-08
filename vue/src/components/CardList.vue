<template>
  <div>
    <router-link :to="{ name: 'deck' }">
      <button type="button" class="btn btn-light btn-large btn-block">
        View Decks
      </button>
    </router-link>
    <div class="cardsList">
      <div
        class="deckShadow"
        v-on:click.prevent="toggleDisplayForm"
        v-if="!displayForm"
      >
        <div class="plus radius" />
      </div>
      <div class="deckFormCard" v-if="displayForm">
        <div class="form-group">
          <div class="editButtons">
            <button class="btn btn-secondary" v-on:click="toggleDisplayForm">
              ❌
            </button>
            <button class="btn btn-secondary" v-on:click.prevent="addDeck">
              ➕
            </button>
          </div>

          <label for="deckName" class="deckName"> Deck Name </label>
          <input
            type="text"
            class="form-control"
            v-model="newDeck.deckTitle"
            required
          />
          <label for="deckDescription" class="deckDescription">
            Deck Description
          </label>
          <input
            type="text"
            class="form-control"
            v-model="newDeck.deckDescription"
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
      displayForm: false,
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
      this.displayForm = !this.displayForm;
    },
  },
  created() {
    flashCardService.getCardsByDeck(this.$route.params.id).then((response) => {
      this.cards = response.data;
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
.deckShadow {
  display: flex;
  justify-content: space-around;
  align-items: center;
  flex-wrap: wrap;
  border-radius: 10px;
  height: 300px;
  width: 250px;
  margin: 40px;
  background-color: #131313d0;
  box-shadow: 15px 15px 3px #00000062;
}
.deckFormCard {
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
  box-shadow: 15px 15px 3px #00000062;
}

.editButtons {
  display: flex;
  justify-content: space-between;
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

























