<template>
  <div>
   <p class="card-title"> {{card.title}} </p>
   <p class="card-text"> {{card.text}} </p>

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