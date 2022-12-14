<template>
  <div>
    <!-- Study Session Button -->
    <span class="study">
      <button
        class="btn btn-lg btn-primary studyButton"
        v-on:click="toggleStudySession(), startTimer()"
        v-if="!studySessionBool && cards.length != 0"
      >
        Start Study Session
      </button>
      <button
        class="btn btn-lg btn-danger studyButton"
        v-on:click="toggleStudySession(), restartStudySession(), stopTimer(), resetTimer()"
        v-if="studySessionBool"
      >
        Cancel Study Session
      </button>
      <button
        class="btn btn-lg btn-primary studyButton"
        v-on:click="addStudySession"
        v-if="studySessionBool"
      >
        Save Study Session
      </button>
    </span>

    <!-- Progress Bar -->
    <span class="progressBars" v-if="studySessionBool">
      <div class="progress">
        <div
          class="
            progress-bar
            bg-success
            progress-bar-striped progress-bar-animated
          "
          role="progressbar"
          :style="{ width: calculateCorrect }"
          aria-valuemin="0"
          aria-valuemax="100"
        >
          {{ calculateCorrect }}
        </div>
        <div
          class="
            progress-bar
            bg-danger
            progress-bar-striped progress-bar-animated
          "
          role="progressbar"
          :style="{ width: calculateIncorrect }"
          aria-valuemin="0"
          aria-valuemax="100"
        >
          {{ calculateIncorrect }}
        </div>
      </div>
      <div class="progressFraction">
        <h1>{{ calculateProgress }}/{{ cards.length }}</h1>
      </div>
    </span>

    <!-- List of Cards -->
    <div class="cardsList">
      <!-- Card Silhoutte -->
      <div
        class="cardShadow"
        v-on:click.prevent="toggleDisplayForm"
        v-show="!displayCardForm"
      >
        <div class="plus radius" v-if="!studySessionBool" />

        <!-- Study Session Timer -->
        <div class="time" v-if="studySessionBool">
          00:00:00
        </div>
        
        <div
          class="timer"
          style="--duration: 60; --size: 100"
          v-if="studySessionBool"
        >
          <div class="mask" v-if="studySessionBool"></div>
        </div>
      </div>

      <!-- Add A Card Form -->
      <div class="cardFormCard" v-if="displayCardForm">
        <div class="form-group">
          <div class="cardEditButtons">
            <button class="btn btn-primary" v-on:click.prevent="addCard">
              ➕
            </button>
            <button class="btn btn-primary" v-on:click="toggleDisplayForm">
              ❌
            </button>
          </div>

          <label for="cardName" class="cardName"> Card Name </label>
          <input
            type="text"
            class="form-control"
            v-model="newCard.cardTitle"
            required
          />
          <label for="cardText" class="cardText"> Card Text </label>
          <input
            type="text"
            class="form-control"
            v-model="newCard.cardText"
            required
          />
          <label for="cardText" class="cardText"> Card Tags </label>
          <input
            type="text"
            class="form-control"
            v-model="newCard.tags"
            required
          />
        </div>
      </div>

     
      <!-- Empty Deck Message -->
      <div v-show="emptyDeck" class="emptydeck">
        <h2>Current Deck is Empty</h2>
      </div>
      <card
        @name="questionCorrectCounter, questionIncorrectCounter"
        v-for="card in cards"
        v-bind:card="card"
        v-bind:key="card.cardId"
        class="card-iterator"
        @questionCorrectEvent="questionCorrectCounter"
        @questionIncorrectEvent="questionIncorrectCounter"
      />
    </div>
  </div>
</template>

<script>
// import StopwatchTimer from "../components/StopwatchTimer.vue";
import flashCardService from "../services/FlashCardService.js";
import Card from "../components/Card.vue";
export default {
  name: "card-list",
  data() {
    return {
      cards: [],
      isDeckEmpty: false,
      displayCardForm: false,
      studySessionBool: false,
      questionCorrect: 0,
      questionIncorrect: 0,
      newCard: {
        cardTitle: "",
        cardText: "",
        tags: "",
      },
      studySession: {
        deckID: 0,
        questionCorrect: 0,
        questionIncorrect: 0,
        total: 0,
        date: 0
      },
      timer: {
          time_el: null,
          seconds: 0,
          interval: null,
      }
    };
  },
  components: {
    Card,
    // StopwatchTimer
  },
  computed: {
    emptyDeck() {
      if (this.cards.length === 0) {
        return true;
      }
      return false;
    },
    calculateScore() {
      let total = this.questionIncorrect + this.questionCorrect;
      let score = this.questionCorrect / total;
      score * 100;
      return score;
    },
    calculateProgress() {
      let complete = this.questionIncorrect + this.questionCorrect;
      return complete;
    },
    calculateCorrect() {
      let correct = this.questionCorrect;
      let total = this.cards.length;
      let correctProgress = Math.round((correct / total) * 100);
      return correctProgress + "%";
    },
    calculateIncorrect() {
      let incorrect = this.questionIncorrect;
      let total = this.cards.length;
      let incorrectProgress = Math.round((incorrect / total) * 100);
      return incorrectProgress + "%";
    },
  },
  methods: {
    toggleDisplayForm() {
      this.displayCardForm = !this.displayCardForm;
    },
    toggleStudySession() {
      this.studySessionBool = !this.studySessionBool;
    },
    restartStudySession() {
      this.questionCorrect = 0;
      this.questionIncorrect = 0;
    },
    addStudySession(studySession) {
      studySession.deckID = this.$route.params.id;
      studySession.questionCorrect = this.questionCorrect;
      studySession.questionIncorrect = this.questionIncorrect;
      studySession.total = this.questionCorrect + this.questionIncorrect;
      
      flashCardService.addStudySession(studySession).then((response) => {
        if (response.status === 201) {
          this.$router.go();
        }
      })
    },
    addCard(deckID, card) {
      deckID = this.$route.params.id;
      card = this.newCard;
      flashCardService.addCard(deckID, card).then((response) => {
        if (response.status === 201) {
          this.$router.go();
        }
      });
    },

    questionCorrectCounter() {
      this.questionCorrect += 1;
    },

    questionIncorrectCounter() {
      this.questionIncorrect += 1;
    },

    updateTimer(){
        this.timer.seconds++;
        let hours = Math.floor(this.timer.seconds / 3600);
        let mins = Math.floor((this.timer.seconds - (hours * 3600)) / 60);
        let secs = this.timer.seconds % 60;
        this.timer.time_el = document.querySelector(".time");
          if(secs < 10){
               secs = '0' + secs;
          }
          if(mins < 10){
               mins = '0' + mins;
          }
          if(hours < 10){
               hours = '0' + hours;
          }

          this.timer.time_el.innerHTML = `${hours}:${mins}:${secs}`;
    },
    startTimer() {
            // if(this.timer.interval){
            //     return
            // }
        this.timer.interval = setInterval(this.updateTimer, 1000)
    },

    stopTimer() {
            clearInterval(this.timer.interval);
            this.timer.interval = null;
    },

    resetTimer() {
            this.stopTimer;
            this.timer.seconds = 0;
            this.timer.time_el.innerHTML = '00:00:00';
    },
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
  align-items: center;
}

.study {
  display: flex;
  justify-content: center;
  margin-top: 15px;
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
  flex-direction: row;
  justify-content: space-around;
  align-items: center;
  flex-wrap: wrap;
  border-radius: 10px;
  height: 300px;
  width: 250px;
  margin: 40px;
  background-color: #dbd5d579;
  box-shadow: 5px 5px 3px #00000062;
  opacity: 0.4;
}

.cardShadowDuringStudy{
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  align-items: center;
  flex-wrap: wrap;
  border-radius: 10px;
  height: 300px;
  width: 250px;
  margin: 40px;
  background-color: #dbd5d579;
  box-shadow: 5px 5px 3px #00000062;
  opacity: 1;
}

.cardFormCard {
  justify-content: space-around;
  align-items: center;
  flex-wrap: wrap;
  border: 5px solid;
  border-color: #0b3954;
  border-radius: 10px;
  height: 300px;
  width: 250px;
  margin: 40px;
  background-color: #F2E8CF;
  box-shadow: 5px 5px 3px #0000008c;
}

.cardEditButtons {
  display: flex;
  justify-content: space-between;
  align-content: flex-start;
}

.btn.btn-primary {
  margin: 5px;
}

.btn.btn-danger.studyButton {
  margin: 5px;
}

.cardFormCard {
  text-align: center;
  padding: 10px;
}

.card-iterator {
  display: flex;
  flex-direction: column;
}

.progress {
  margin: 1vh 15vw;
  grid-area: "bar";
}

.progressBars {
  align-content: center;
}

.progressFraction {
  align-content: center;
  color: #F2E8CF;
  text-shadow: 2px 2px #0b3954;
}

h1 {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
  text-align: center;
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

.timer {
  background: -webkit-linear-gradient(left, #0496ff 50%, #fff4e4 50%);
  border-radius: 100%;
  height: calc(var(--size) * 1px);
  width: calc(var(--size) * 1px);
  position: relative;
  -webkit-animation: time calc(var(--duration) * 1s) steps(1000, start) infinite;
  -webkit-mask: radial-gradient(transparent 50%, #000 50%);
  mask: radial-gradient(transparent 50%, #000 50%);
}
.mask {
  border-radius: 100% 0 0 100% / 50% 0 0 50%;
  height: 100%;
  left: 0;
  position: absolute;
  top: 0;
  width: 50%;
  -webkit-animation: mask calc(var(--duration) * 1s) steps(500, start) infinite;
  -webkit-transform-origin: 100% 50%;
}
@-webkit-keyframes time {
  100% {
    -webkit-transform: rotate(360deg);
  }
}
@-webkit-keyframes mask {
  0% {
    background: #eee;
    -webkit-transform: rotate(0deg);
  }
  50% {
    background: #eee;
    -webkit-transform: rotate(-180deg);
  }
  50.01% {
    background: #0496ff;
    -webkit-transform: rotate(0deg);
  }
  100% {
    background: #0496ff;
    -webkit-transform: rotate(-180deg);
  }
}

.time {
  display: flex;
  flex-direction: row;
  align-self: flex-start;
  font-size: 50px;
  color: white;
}
</style>

























