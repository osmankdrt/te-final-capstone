<template>
    <body>
        <section class="billboard clearfix">
            <div class="container">
                <h1>CREATIVE MINDS</h1>
                <h2 class="page">You can Be your own teacher</h2>
                <ul class="cta-buttons">
                <li>
                <router-link class="learn-more" :to="{ name: 'login' }">GET STARTED</router-link></li>
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
              <h2 class="service">SERVICES</h2>
             <p>These are our samples of the decks, and cards. You could start a study session  <br />which helps you keep track of your scores and enhance your learning process. What are you waiting for get started now!</p>
                <img  class="Decks-img" src='../assets/decks.jpg'/>
                  <img  class="Cards-img" src='../assets/cards.jpg'/>
                  <img  class="study-img" src='../assets/study.jpg'/>
              </div>
        </section> <!-- end section-style -->  
        <section class="section-style team">
            <div class="container">
                <h1 class="section-intro">THE TEAM</h1>
                <ul class="team-profiles">
                <li class="member-profile prof-1">
                    <h3 class="tm-name">Binyam Tekae</h3>
                    <h4 class="tm-role">Software Developer</h4>
                    <p class="tm-info">Binyam is the man responsible for most of the graphic design. He is also a famous super hero by night.</p>
                   <a class="social" href="https://www.linkedin.com/in/binyam-tekae/" target="_blank"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-linkedin" viewBox="0 0 16 16">
  <path d="M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854V1.146zm4.943 12.248V6.169H2.542v7.225h2.401zm-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248-.822 0-1.359.54-1.359 1.248 0 .694.521 1.248 1.327 1.248h.016zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016a5.54 5.54 0 0 1 .016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225h2.4z"/>
</svg></a>
                    <img class="member-photo" src="../assets/Binyam.Tekae.jpg"/>
                </li> <!-- end member profile -->
                <li class="member-profile prof-2">
                    <h3 class="tm-name">Ian West</h3>
                    <h4 class="tm-role">Software Developer</h4>
                    <p class="tm-info">Ian is a full stack developer based in Columbus, Ohio. When not behind a keyboard, Ian is an avid cyclist and can often be found outdoors with his partner and their dog Pretzel.</p>
                    <a class="social" href="https://www.linkedin.com/in/ianwest614/" target="_blank"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-linkedin" viewBox="0 0 16 16">
  <path d="M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854V1.146zm4.943 12.248V6.169H2.542v7.225h2.401zm-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248-.822 0-1.359.54-1.359 1.248 0 .694.521 1.248 1.327 1.248h.016zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016a5.54 5.54 0 0 1 .016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225h2.4z"/>
</svg></a>
                    <img class="member-photo" src="../assets/Ian.West.jpg"/>
                </li> <!-- end member profile -->
                <li class="member-profile prof-3">
                    <h3 class="tm-name">Osman Burgazli</h3>
                    <h4 class="tm-role">Software Developer</h4>
                    <p class="tm-info">Osman is the man responsible for most of the graphic design. He is also a famous super hero by night.</p>
                    <a class="social" href="https://www.linkedin.com/in/osmanburgazli/" target="_blank"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-linkedin" viewBox="0 0 16 16">
  <path d="M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854V1.146zm4.943 12.248V6.169H2.542v7.225h2.401zm-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248-.822 0-1.359.54-1.359 1.248 0 .694.521 1.248 1.327 1.248h.016zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016a5.54 5.54 0 0 1 .016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225h2.4z"/>
</svg></a>
                    <img class="member-photo" src="../assets/Osman.Burgazli.jpg"/>
                </li> <!-- end member profile -->
                <li class="member-profile prof-4">
                    <h3 class="tm-name">Istar Hashi</h3>
                    <h4 class="tm-role">Software Developer</h4>
                    <p class="tm-info">Istar is a woman of many talents but the most current ones are being able to eat a bucket of ice cream in one sitting and also being a full stack software developer.</p>
                    <a class="social" href="https://www.linkedin.com/in/istar-hashi/" target="_blank"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-linkedin" viewBox="0 0 16 16">
  <path d="M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854V1.146zm4.943 12.248V6.169H2.542v7.225h2.401zm-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248-.822 0-1.359.54-1.359 1.248 0 .694.521 1.248 1.327 1.248h.016zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016a5.54 5.54 0 0 1 .016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225h2.4z"/>
</svg></a>
                    <img class="member-photo" src="../assets/Istar.Hashi.jpg"/>
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
@import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css");
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
  height: 835px;
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
  color: rgb(12, 2, 2);
  letter-spacing: 10px;
  font-style: 'Open Sans';
  font-weight: 300;
}
.page {
  text-align: center;
  font-size: 3em;
  color: rgb(12, 1, 1);
  letter-spacing: 1px;
}
.cta-buttons {
  text-align: center;
  font-style: inherit;
  font-weight: 400;
  font-size: 40px;
  
}

.cta-buttons li {
  display: inline-block;
  color: #222;
}

.cta-buttons a {
  display: inline-block;
  padding: 20px 40px;
  color: rgb(12, 4, 4);
  margin: 20px;
}

.learn-more {
  border: 5px solid rgb(41, 40, 40);
  transition: .5s;
  border-radius: 15px;
}

.learn-more:hover {
  background-color: rgb(122, 187, 149);
  color: rgb(22, 12, 12);
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
  padding: 30px;
  width: 35vw;
}
.study-img{
  padding: 30px;
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
  /* border: 1px solid #999;
  display: block; */
  /* padding: 5px; */
  /* border-radius: 50%; */
  /* margin-bottom: 40px;  */
  display: block;
  position: initial;
  
}

.social img {
  height: 18px;
  width: 18px;
  display: block;
}

.member-photo {
    position: relative;
    border-radius: 50%;
    float: center;
    width:  140px;
    height: 140px;
    object-fit: cover;
}
</style>