<template>
  <div class = 'footer'>
      
        <div class="global">
      <!-- <div class="curve"></div> -->
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-md-3">
            <h6>Meet our family</h6>
            <p>Our family was created in 2022 with hopes of helping people all around the world to gain a better understanding of different languages.
              We started out simply just working out of a shoe box and now on to bigger and better things!
            </p>
          </div>

          <div class="col-sm-6 col-md-2">
              <h6>Services</h6>
              <ul>
                <li><a href="#">Study Sessions</a> </li>
                <li><a href="#">Decks</a> </li>
                <li><a href="#">Cards</a> </li>
                <li><a href="#">Graphs</a> </li>
              </ul>
          </div>

          <div class="col-sm-6 col-md-2">
              <h6>About</h6>
              <ul>
                <li><a href="#">Our Story</a> </li>
                <li><a href="#">Benefits</a> </li>
                <li><a href="#">Team</a> </li>
                <li><a href="#">Careers</a> </li>
              </ul>
          </div>

          <div class="col-sm-6 col-md-2">
              <h6>Legal</h6>
              <ul>
                <li><a href="#">Terms & Conditions</a> </li>
                <li><a href="#">Privacy Policy</a> </li>
                <li><a href="#">Terms of use</a> </li>
              </ul>
          </div>

          <div class="social">
            <h6>Follow us</h6>
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-snapchat-ghost"></i></a>
            <a href="#"><i class="fa fa-instagram"></i></a>
            <a href="#"><i class="fa fa-google-plus"></i></a>
          </div>

        </div>
        <p class="copyright"> &copy; Copyright All rights reserved. </p>
      </div>
    </div>


  </div>
</template>

<script>
export default {
name: 'app-footer'
}
</script>

<style scoped>
@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css');
@import url('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css');
@import url('https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css');


.footer{
  background-color:#fff4e4;
 
  height: 76px;
  
}
.footerText{
  forced-color-adjust: black;
}

*{
  margin: 0px;
  padding: 0px;
}
html, body{
  font-family: "Lato", sans-serif;
  
}
.row{
  margin-left: 0px;
  margin-right: 0px;
}
.global{
  padding: 50px;
  color: #0a0a0a;
  margin-top: 80px;
  /* background-image: url(https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi1.wp.com%2Ftechbeasts.com%2Fwp-content%2Fuploads%2F2016%2F05%2Fmountain_nature_elegant_wallpaper_3f.jpg&f=1&nofb=1); */
  background-repeat: no-repeat;
  background-color: #CDD5D1;
  background-position: center;
  background-size: cover;
  opacity: 0.9;
  font-family: 'Open Sans', arial, sans-serif;
  
  text-decoration: none;
}
/* .global .curve{
  position: absolute;
  top: 17%;
  background: #000;
  opacity: 0.2;
  width: 90%;
  height: 38%;
  border-top-right-radius: 100px;
  border-bottom-left-radius: 100px;
} */
.global h6{
  margin-top: 0;
  margin-bottom: 12px;
  font-weight: 700;
  font-size: 18px;
  text-transform: uppercase;
  letter-spacing: 1px;
}
.global ul{
  list-style-type: none;
  line-height: 30px;
  font-size: 15px;
  margin-bottom: 0;
}
.global ul a{
  color: rgb(7, 7, 7);
  text-decoration: none;
  transition: 0.3s;
}
.global ul a:hover{
  opacity: 0.8;
  color: #eee;
}
.global .social{
  width: 100%;
  margin: 0 auto;
  text-align: center;
  padding: 40px;
  padding-bottom: 0px;
  border-top: 1px solid #eee;
  margin-top: 50px;
}
.global .social a{
  font-size: 22px;
  width: 45px;
  height: 45px;
  line-height: 39px;
  display: inline-block;
  border-radius: 50%;
  border: 2px solid #05ff05;
  box-shadow: 0px 0px 0px 1px rgba(255, 255, 255, 0.4);
  margin: 10px;
  color: rgb(5, 5, 5);
  opacity: 0.7;
  transition: 0.3s ease-in-out;
}
.global .social a:hover{
  opacity: 0.9;
  box-shadow: 0px 1px 3px 2px rgba(255, 255, 255, 0.9);
}
.global .copyright{
  text-align: center;
  padding-top: 24px;
  font-weight: 500;
  opacity: 0.8;
  font-size: 16px;
}
@media (max-width: 767px) {

    .global .curve{
      left: 5%;
      height: 70%;
    }
    .global h6{
      margin: 0 auto;
      text-align: center;
      margin-top: 10px;
      margin-bottom: 10px;
    }
    .global ul{
      text-align: center;
    }
    .social{
      margin: 0 auto;
    }
}


</style>