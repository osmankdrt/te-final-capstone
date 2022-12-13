<template>
  <div class="home">
    <!-- <img src="../assets/homepage.jpg" alt=""> -->
    <p class ="slogan">"A different language is a different vision of life." - Federico Fellini</p>
    <!-- <app-public></app-public> -->
   
  </div>
</template>

<script>
// import AppPublic from '../components/AppPublic.vue'

export default {
  name: "home",
  components: {
    // AppPublic,
    
  }
};
</script>

<style scoped>

/* img {
  display: flex;
  justify-content: center;
  height: 75vh;
  width: 60vw;
  opacity: 60%;
} */

.home {
  background-image: url("../assets/learn.jpeg");
   height: 100%; 

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;

  
}

.slogan{
  font-style: italic;
  font-family: Arial, Helvetica, sans-serif;
  position: absolute;
  top: 300px;
  right: 40px;
  text-align: right;
  font-size: 24px;
}

@media only screen and (max-width: 550px) {
   .home {
    
    height: 85vh;
    width: 100vw;
  }
}

</style>