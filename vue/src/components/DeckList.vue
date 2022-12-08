<template>
  <div>
    <div class="deckList">
      
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
            <svg
              v-on:click.prevent="addDeck"
              xmlns="http://www.w3.org/2000/svg"
              width="30"
              height="30"
              fill="currentColor"
              class="bi bi-plus-square"
              viewBox="0 0 16 16"
            >
              <path
                d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"
              />
              <path
                d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"
              />
            </svg>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="32"
              height="32"
              fill="currentColor"
              class="bi bi-pencil-square"
              viewBox="0 0 16 16"
            >
              <path
                d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"
              />
              <path
                fill-rule="evenodd"
                d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"
              />
            </svg>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="30"
              height="30"
              fill="currentColor"
              class="bi bi-x-square"
              viewBox="0 0 16 16"
            >
              <path
                d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"
              />
              <path
                d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"
              />
            </svg>
          </div>
          <label for="deckName" class="deckName"> Deck Name </label>
          <input
            type="text"
            class="form-control"
            v-model="newDeck.deckName"
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
      displayForm: false,
      newDeck: {},
    };
  },
  props: {
    deck: Object,
  },
  components: {
    Deck,
  },
  computed: {
    //  filteredDecks() {
    //      return this.$store.state.decks;
    //  },
  },
  methods: {
    toggleDisplayForm() {
      this.displayForm = !this.displayForm;
    },
    addDeck() {
      flashCardService.addDecks(this.newDeck).then(response => {
        if(response.status === 201) {
          this.$router.push('deck')
        }
      })
    }
  },
  created() {
    flashCardService.listDecks().then((response) => {
      this.decks = response.data;
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
  border-color: #d7fff1;
  border-radius: 10px;
  height: 300px;
  width: 250px;
  margin: 40px;
  background-color: #77af9c;
  box-shadow: 15px 15px 3px #00000062;
}
.deckName {
  font-family: Arial, Helvetica, sans-serif;
  padding: 20px;
  text-align: center;
  color: #285943;
  text-shadow: 1px 1px #00000041;
  font-weight: bold;
}

.deckDescription {
  font-family: Arial, Helvetica, sans-serif;
  text-align: center;
}

.deckFormCard {
  text-align: center;
  padding: 10px;
}

.editButtons {
  display: flex;
  justify-content: space-around;
  justify-items: flex-end;
  
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