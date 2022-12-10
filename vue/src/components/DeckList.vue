<template>
    <div class="deckList">
      <div
        class="deckShadow"
        v-on:click.prevent="toggleDisplayForm"
        v-show="!displayForm"
      >
        <div class="plus radius" />
      </div>

      <div class="deckFormCard" v-if="displayForm">
        <div class="form-group">
          
          <div class="editButtons">
             <button class="btn btn-primary" v-on:click.prevent="addDeck">
              ➕
            </button>
            <button class="btn btn-primary" v-on:click="toggleDisplayForm">
              ❌
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
      <deck v-for="deck in decks" v-bind:deck="deck" v-bind:key="deck.deckId" />
    </div>
</template>

<script>
import Deck from "../components/Deck.vue";
import flashCardService from "../services/FlashCardService.js";

export default {
  name: "deck-list",
  data() {
    return {
      id: 0,
      decks: [],
      deckToDelete: 0,
      displayForm: false,
      newDeck: {
        deckTitle: "",
        deckDescription: "",
      },
    };
  },
  props: {
    deck: Object,
  },
  components: {
    Deck,
  
  },
  computed: {},
  methods: {
    toggleDisplayForm() {
      this.displayForm = !this.displayForm;
    },
    addDeck() {
      flashCardService.addDecks(this.newDeck).then((response) => {
        if (response.status === 201) {
          this.$router.go();
          // this.$router.push(`/decks/${response.data.id}/cards`)
        }
      });
    },
  },
  created() {
    flashCardService.listDecks().then((response) => {
      this.decks = response.data;
      this.decks = this.decks.reverse();
    });
  },
};
</script>

<style scoped>
.deckList {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-evenly;
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
  border-color: #0496FF;
  border-radius: 10px;
  height: 300px;
  width: 250px;
  margin: 40px;
  background-color: #fff4e4;
  box-shadow: 15px 15px 3px #00000062;
}
.deckName {
  font-family: Arial, Helvetica, sans-serif;
  text-align: center;
  color: #0496FF;
  

  
}

.deckDescription {
  font-family: Arial, Helvetica, sans-serif;
  text-align: center;
  color: #0496FF;
}

.deckFormCard {
  text-align: center;
  padding: 10px;
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