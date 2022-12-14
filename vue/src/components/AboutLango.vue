<template>
    <body>
        <section class="billboard clearfix">
            <div class="container">
                <h1>CREATIVE IDEAS</h1>
                <ul class="cta-buttons">
                <li>
                <router-link class="learn-more" :to="{ name: 'login' }">LEARN MORE</router-link></li>
                </ul>
            </div> <!-- end container -->
        </section> <!-- end billboard -->
        <section class="section-style clearfix">
            <div class="container">
                <h1 class="section-intro">ABOUT US</h1>
                <p>We are Lango. We offer a creative flashcard learning style for languages. We <br /> take pride in our work and everything we create is executed with precision and love.</p>
                <img  class="res-image" src='../assets/kids.jpg'/>
            </div> <!-- end container -->
            <div class= "services">
              <h2 class="service">services</h2>
             <p>This are our samples of our Decks, Cards, And you could start a study session <br /> helps you track your Scores. Once The User LogIn Or Register. Hope you enjoy it.</p>
                <img  class="Decks-img" src='../assets/decks.jpg'/>
                  <img  class="Cards-img" src='../assets/cards.jpg'/>
                  <img  class="Cards-img" src='../assets/studyset.jpg'/>
              </div>
        </section> <!-- end section-style -->  
        <section class="section-style team">
            <div class="container">
                <h1 class="section-intro">THE TEAM</h1>
                <ul class="team-profiles">
                <li class="member-profile prof-1">
                    <h3 class="tm-name">Binyam Tekae</h3>
                    <h4 class="tm-role">Software Developer</h4>
                    <p class="tm-info">Bruce is the man responsible for most of the graphic design. He is also a famous super hero by night.</p>
                    <a class="social" href="https://www.linkedin.com/in/binyam-tekae/" target="_blank"><font-awesome-icon icon="fab fa-linkedin-in" /></a>
                    <img class="member-photo" src="http://www.salesthroughservice.com/wp-content/uploads/2016/08/02_man.png.pagespeed.ce_.DsQWH7NpKI.png"/>
                </li> <!-- end member profile -->
                <li class="member-profile prof-2">
                    <h3 class="tm-name">Ian West</h3>
                    <h4 class="tm-role">Software Developer</h4>
                    <p class="tm-info">Bruce is the man responsible for most of the graphic design. He is also a famous super hero by night.</p>
                    <a class="social" href="https://www.linkedin.com/in/ianwest614/" target="_blank"><font-awesome-icon icon="fab fa-linkedin-in" /></a>
                    <img class="member-photo" src="http://www.salesthroughservice.com/wp-content/uploads/2016/08/02_man.png.pagespeed.ce_.DsQWH7NpKI.png"/>
                </li> <!-- end member profile -->
                <li class="member-profile prof-3">
                    <h3 class="tm-name">Osman Burgazli</h3>
                    <h4 class="tm-role">Software Developer</h4>
                    <p class="tm-info">Bruce is the man responsible for most of the graphic design. He is also a famous super hero by night.</p>
                    <a class="social" href="https://www.linkedin.com/in/osmanburgazli/" target="_blank"><font-awesome-icon icon="fab fa-linkedin-in" /></a>
                    <img class="member-photo" src="http://www.salesthroughservice.com/wp-content/uploads/2016/08/02_man.png.pagespeed.ce_.DsQWH7NpKI.png"/>
                </li> <!-- end member profile -->
                <li class="member-profile prof-4">
                    <h3 class="tm-name">Istar Hashi</h3>
                    <h4 class="tm-role">Software Developer</h4>
                    <p class="tm-info">Bruce is the man responsible for most of the graphic design. He is also a famous super hero by night.</p>
                    <a class="social" href="https://www.linkedin.com/in/istar-hashi/" target="_blank"><font-awesome-icon icon="fab fa-linkedin-in" /></a>
                    <img class="member-photo" src="http://www.salesthroughservice.com/wp-content/uploads/2016/08/02_man.png.pagespeed.ce_.DsQWH7NpKI.png"/>
                </li> <!-- end member profile -->
                </ul> <!-- end team profiles -->
            </div> <!-- end container -->
        </section>
    </body>    
 
</template>

<script>
export default {
name: 'about-lango'
}
</script>
<style scoped>
* {
  padding: 0;
  margin: 0;
  font-family: 'Open Sans', arial, sans-serif;
  text-decoration: none;
}
.container {
  width: 85%;
  margin: 0 auto;
}
.billboard {
  height: 700px;
  width: 100%;
  background-image: url('../assets/learn.jpeg');
  background-repeat: no-repeat;
  background-size: cover;
  float: left;
  display: inline-block;
}

.billboard h1 {
  text-align: center;
  margin: 250px 0 30px 0;
  font-size: 5em;
  color: #fff;
  letter-spacing: 10px;
  font-style: 'Open Sans';
  font-weight: 300;
}
.cta-buttons {
  text-align: center;
  font-style: inherit;
  font-weight: 400;
}

.cta-buttons li {
  display: inline-block;
}

.cta-buttons a {
  display: inline-block;
  padding: 20px 40px;
  color: #fff;
  margin: 20px;
}

.learn-more {
  border: 2px solid #fff;
  transition: .5s;
  border-radius: 10px;
}

.learn-more:hover {
  background-color: #fff;
  color: #444;
}
.section-style {
  width: 100%;
  padding-top: 70px;
  display: inline-block;
  text-align: center;
  font-family: inherit;
}

.section-intro {
  font-size: 3em;
  font-weight: 300;
  color: #222;
  margin-bottom: 60px;
  position: relative;
  z-index: 5;
}
.service {
  font-size: 3em;
  font-weight: 300;
  color: #222;
  margin-bottom: 60px;
  position: relative;
  z-index: 5;
}
.service:after {
  content: "";
  display: block;
  border: 1px solid; 
  width: 100px;
  margin: 10px auto 0px auto;
}
.Decks-img{
  padding: 10px;
  width: 40vw;
}
.Cards-img{
  padding: 20px;
  width: 36vw;
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

.section-style .res-image {
  display: inline-block;
  margin-top: 60px;
  border-radius: 50%;
}

.team-profiles {
  width: 100%;
  list-style: none;
  position: relative;
}

.member-profile {
  width: 23.3333%;
  display: inline-block;
  position: relative;
  overflow: hidden;
}

.tm-name {
  color: #222;
  font-weight: 300;
  text-align: center;
}

.tm-role {
  color: #222;
  font-weight: 300;
  font-style: italic;
  margin-bottom: 20px;
  text-align: center;
}

.tm-info {
  color: #777;
  margin-bottom: 20px;
  text-align: center;
}

.social {
  border: 1px solid #999;
  display: inline-block;
  padding: 5px;
  border-radius: 50%;
  margin-bottom: 40px;
}

.social img {
  height: 18px;
  width: 18px;
  display: block;
}

.member-photo {
  position: relative;
  right: 20px;
  top: 40px;
  margin-top: 30px;
  width: 100%;
}
</style>