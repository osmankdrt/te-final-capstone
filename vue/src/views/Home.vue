<template>
  <div class="home">
    <img src="../assets/homepage.jpg" alt="">
    <p>Slogan Here</p>
    <app-public></app-public>
  </div>
</template>

<script>
import AppPublic from '../components/AppPublic.vue'
export default {
  name: "home",
  components: {
    AppPublic
  }
};
</script>



<style scoped>

img {
  display: flex;
  justify-content: flex-end;
  height: 75vh;
  width: 60vw;
  opacity: 60%;
}

@media only screen and (max-width: 550px) {
   img {
    
    height: 85vh;
    width: 100vw;
  }
}

</style>