<template>
  <div>
   <p class="card-title"> {{card.cardTitle}} </p>
   <p class="card-text"> {{card.cardText}} </p>

  </div>
</template>

<script>

export default {
name:'card',
props: {
  card: Object,
}
}
</script>

<style>

</style>