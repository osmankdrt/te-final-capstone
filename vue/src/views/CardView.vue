<template>
  <div>
  <card-list />
  </div>

</template>

<script>
import CardList from '../components/CardList.vue'
export default {
name: 'card-view',
components:{
    CardList
},
computed: {
  card() {
    return this.$store.getters.card;
  }
},
created() {
  const activeDeckId = this.$route.params.id;
  this.$store.commit("SET_ACTIVE_DECK", activeDeckId)
}
}
</script>

<style>

</style>