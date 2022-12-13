<template>
  
   <div class="container">
     <h1 class="section-intro">ABOUT US</h1>
     <p>We are Lango. We offer a creative flashcard learning style for languages. We <br /> take pride in our work and everything we create is executed with precision and love.</p>
     
   </div> <!-- end container -->
 
</template>

<script>
export default {
name: 'about-lango'
}
</script>
<style scoped>

.container { 


  height: 100%; 

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  /* background-image:url("../assets/world-flags.jpg") ; */
  text-align: center;
}
.section-intro {
  font-size: 3em;
  font-weight: 300;
  color: #222;
  margin-bottom: 60px;
  position: relative;
  z-index: 5;
}

.section-intro:after {
  content: "";
  display: block;
  border: 1px solid; 
  width: 100px;
  margin: 10px auto 0px auto;
}

section p {
  color: #555;
  line-height: 25px;
  font-weight: 300;
  position: relative;
  z-index: 5;
}



</style>