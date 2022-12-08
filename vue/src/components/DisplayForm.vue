<template>
<div>
<div
        class="deckShadow"
        v-on:click.prevent="toggleDisplayForm"
        v-show="!displayForm"
      >
        <div class="plus radius" />
      </div>
  <div class="deckFormCard">
      <div class="form-group">
        <label for="deckName" class="deckName"> Deck Name </label>
          <input
            type="text"
            class="form-control"
            v-model="deckToUpdate.deckTitle"
            required
        />
        <label for="deckDescription" class="deckDescription">
            Deck Description
        </label>
          <input
            type="text"
            class="form-control"
            v-model="deckToUpdate.deckDescription"
            required
          />
        </div>
      </div> 
      </div>
</template>

<script>
export default {
name: 'display-form',
data() {
  return {
    displayForm: false
  }
},

methods: {
  toggleDisplayForm(){
    this.displayForm = !this.displayForm
  }
}
}
</script>

<style scoped>

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
</style>