<template>
  <div class="cards" v-on:click="showCard">
    <p class="card-title" v-show="!show">{{ card.cardTitle }}</p>
    <p class="card-text" v-show="show">{{ card.cardText }}</p>
  </div>
</template>

<script>
export default {
  name: "card",
  data() {
    return {
      show: false,
    };
  },
  props: {
    card: Object,
  },

  methods: {
    showCard() {
      this.show = !this.show;
      return this.show;
    },
  },
};
</script>

<style scoped>
.cards {
  display: flex;
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
.card-text {
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
</style>