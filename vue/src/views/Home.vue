<template>
  <div class="home">
    <img src="../assets/homepage.jpg" alt="">
  </div>
</template>

<script>
export default {
  name: "home"
};
</script>



<style scoped>
.routerview{
  display: flex;
}

img {
  height: 85vh;
  width: 100vw;
  opacity: 50%;
  /*margin-left: -95px;*/
}

@media only screen and (max-width: 550px) {
   img {
    
    height: 85vh;
    width: 100vw;
  }
}

</style>