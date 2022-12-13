<template>
  <div class="cards" v-on:click="showCard">
   
    <!-- Edit Card -->
    <div class="cardEditButtons" v-if="this.$parent.studySession == false">
      <button
        type="button"
        class="btn btn-primary"
        v-on:click.prevent="toggleDisplayForm"
      >
        ✏️
      </button>
      <button
        type="button"
        class="btn btn-primary"
        v-on:click.prevent="deleteCard"
      >
        ❌
      </button>
    </div>

    <!-- Flip Card -->
    <div class="flip-card">
      <div class="inner-card">
        <!-- Front of Card -->
        <div class="front-card">
          <p class="card-title" v-show="!show">{{ card.cardTitle }}</p>
          <p class="card-tags" v-show="!show">{{ card.tags }}</p>
        </div>

        <!-- Back of Card -->
        <div class="back-card" v-show="show">
          <p class="card-text">{{ card.cardText }}</p>
          <div
            class="studySessionButtons"
            v-show="this.$parent.studySession"
            v-if="!hasBeenClicked"
            v-bind:disabled="hasBeenClicked"
            v-on:click="toggleHasBeenClicked"
          >
            <button
              class="btn btn-primary btn-sm"
              v-on:click="$emit('questionCorrectEvent')"
            >
              Mark Correct ✔️
            </button>
            <button
              class="btn btn-secondary btn-sm"
              v-on:click="$emit('questionIncorrectEvent')"
            >
              Mark Incorrect ❌
            </button>
          </div>
        </div>

        <!-- Edit Card Form -->
        <div v-show="displayCardForm" class="cardFormCard">
          <label for="cardName" class="cardName"> Card Name </label>
          <input
            type="text"
            v-on:click.prevent=""
            class="form-control"
            v-model="cardToUpdate.cardTitle"
          />
          <label for="cardText" class="cardText"> Card Text </label>
          <input
            type="text"
            v-model="cardToUpdate.cardText"
            class="form-control"
          />
          <label for="tags" class="tags"> Card Tags </label>
          <input type="text" v-model="cardToUpdate.tags" class="form-control" />
          <button class="Save btn btn-primary" v-on:click.prevent="updateCard">
            Save
          </button>
          <button
            class="Cancel btn btn-danger"
            v-on:click.prevent="toggleDisplayForm"
          >
            Cancel
          </button>
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
      hasBeenClicked: false,
      cardToDeleteID: 0,
      cardToUpdate: {
        cardID: 0,
        cardTitle: "",
        cardText: "",
        tags: "",
      },
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
    toggleHasBeenClicked() {
      this.hasBeenClicked = !this.hasBeenClicked;
    },
    deleteCard() {
      this.cardToDeleteID = this.card.cardID;
      flashCardService.deleteCard(this.cardToDeleteID).then((response) => {
        if (response.status === 204) {
          this.$router.go();
        }
      });
    },
    updateCard() {
      this.cardToUpdate.cardID = this.card.cardID;
      flashCardService.updateCard(this.cardToUpdate).then((response) => {
        if (response.status === 200) {
          this.$router.go();
        }
      });
    },
    // toggleCSS(){
    //         let cards = document.querySelectorAll('.cards');
    //         cards.forEach((card)=>{
    //         card.addEventListener('click', function() {
    //         card.classList.toggle('is-flipped');
    //         });
    //     });
    //     },
  },
  computed: {},
};
</script>

<style scoped>
.cards {
  align-content: center;
  border: 7px solid;
  border-color: #0B3954;
  border-radius: 10px;
  height: 300px;
  width: 250px;
  margin: 40px;
  background-color: #F2E8CF;
  box-shadow: 6px 6px 3px #0000008c;
  overflow-y: auto;
}

p.card-text {
  display: flex;
  justify-content: center;
  text-align: center;
  color: #2B4141;
  padding: 5px;
  font-size: 2vh;
  overflow-y: auto;
}
.card-title {
  font-family: Arial, Helvetica, sans-serif;
  text-align: center;
  padding: 5px;
  color: #0B3954;
  text-shadow: 1px 1px #00000041;
  font-weight: bold;
  font-size: 3vh;
}

.cardFormCard {
  text-align: center;
  padding: 10px;
}

.cardEditButtons {
  display: flex;
  justify-content: space-between;
}

.btn.btn-primary {
  margin: 10px;
}

.btn.btn-secondary {
  margin: 10px;
}

.card-tags {
  font-family: Arial, Helvetica, sans-serif;
  text-align: center;
  padding: 5px;
}

.studySessionButtons {
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
}

/* .flip-card {
  display: inline-block;
  width: 200px;
  height: 260px;
   border: 1px solid #CCC; 
  margin: 40px 0;
  perspective: 600px;
} */

/* .inner-card {
  position: relative;
  width: 100%;
  height: 100%;
  cursor: pointer;
  transform-style: preserve-3d;
  transform-origin: center right;
  transition: transform .5s;
} */

/* .cards.is-flipped {
  transform: translateX(-100%) rotateY(-180deg);
}

.card-face {
  position: absolute;
  width: 100%;
  height: 100%;
  line-height: 260px;
  color: white;
  text-align: center;
  font-weight: bold;
  font-size: 40px;
  backface-visibility: hidden;
}

 .front-card {
  background: crimson;
} 

.back-card {
   background: slateblue; 
  transform: rotateY(180deg);
} */
</style>