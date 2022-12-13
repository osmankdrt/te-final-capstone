<template>
  <div class="header">
    <div class="logoBox">
      <img id="logo" src="../assets/langologotrimmed.png" alt="Lango Logo" />
      <h1>Lango</h1>
    </div>

    <nav class="nav">
      <div class="homeLink">
        <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;&nbsp;
      </div>
      <div class="decksLink">
        <router-link v-bind:to="{ name: 'deck' }">Decks</router-link
        >&nbsp;&nbsp;
      </div>
      <div class="sessionsLink">
        <router-link v-bind:to="{ name: 'studysession' }">Study Sessions</router-link
        >&nbsp;&nbsp;
      </div>
      <div class="loginLink">
        <button class="btn btn-light" v-show="$store.state.token == ''">
          <router-link
            v-bind:to="{ name: 'login' }"
            v-show="$store.state.token == ''"
            >Login</router-link
          >
        </button>
        <button class="btn btn-light" v-show="$store.state.token">
          <router-link
            v-bind:to="{ name: 'logout' }"
            v-show="$store.state.token != ''"
            >Logout</router-link
          >
        </button>
      </div>
    </nav>
  </div>
</template>

<script>
export default {
  name: "app-header",
  data() {
    return {
      show: false,
    };
  },
  methods: {
    toggleShow() {
      this.show = !this.show;
    },
  },
};
</script>
<style scoped>
.header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  background-color: #52AD9C;
  top: 0%;
  padding: 10px;
  justify-content: space-between;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
}

.logoBox {
  display: flex;
  align-items: center;
}

#logo {
  height: 75px;
  width: 75px;
}
.nav {
  display: flex;
  align-items: baseline;
  align-content: center;
  text-align: end;
}

a.router-link-exact-active.router-link-active {
  text-decoration: none;
  color: #0b3954;
  font-weight: bold;
}

a {
  text-decoration: none;
  color: #0b3954;
  font-weight: bold;
}

button {
  border-radius: 10px;
  background: white;
  border-color: white;
}

h1 {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
  color: #043152;
}

.homeLink {
  padding: 10px 15px;
  margin-right: 20px;
}

.decksLink {
  padding: 10px 15px;
  margin-right: 20px;
}

.loginLink {
  padding: 10px 15px;
  margin-right: 10px;
}

.sessionsLink {
  padding: 10px 15px;
  margin-right: 20px;
}

.homeLink {
  display: inline-block;
  vertical-align: middle;
  -webkit-transform: perspective(1px) translateZ(0);
  transform: perspective(1px) translateZ(0);
  box-shadow: 0 0 1px rgba(0, 0, 0, 0);
  position: relative;
  overflow: hidden;
}
.homeLink:before {
  content: "";
  position: absolute;
  z-index: -1;
  left: 0;
  right: 0;
  top: 0;
  background: #0b3954;
  height: 4px;
  -webkit-transform: translateY(-4px);
  transform: translateY(-4px);
  -webkit-transition-property: transform;
  transition-property: transform;
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -webkit-transition-timing-function: ease-out;
  transition-timing-function: ease-out;
}
.homeLink:hover:before,
.homeLink:focus:before,
.homeLink:active:before {
  -webkit-transform: translateY(0);
  transform: translateY(0);
}

.decksLink {
  display: inline-block;
  vertical-align: middle;
  -webkit-transform: perspective(1px) translateZ(0);
  transform: perspective(1px) translateZ(0);
  box-shadow: 0 0 1px rgba(0, 0, 0, 0);
  position: relative;
  overflow: hidden;
}
.decksLink:before {
  content: "";
  position: absolute;
  z-index: -1;
  left: 0;
  right: 0;
  top: 0;
  background: #0b3954;
  height: 4px;
  -webkit-transform: translateY(-4px);
  transform: translateY(-4px);
  -webkit-transition-property: transform;
  transition-property: transform;
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -webkit-transition-timing-function: ease-out;
  transition-timing-function: ease-out;
}
.decksLink:hover:before,
.decksLink:focus:before,
.decksLink:active:before {
  -webkit-transform: translateY(0);
  transform: translateY(0);
}

.loginLink {
  display: inline-block;
  vertical-align: middle;
  -webkit-transform: perspective(1px) translateZ(0);
  transform: perspective(1px) translateZ(0);
  box-shadow: 0 0 1px rgba(0, 0, 0, 0);
  position: relative;
  overflow: hidden;
}
.loginLink:before {
  content: "";
  position: absolute;
  z-index: -1;
  left: 0;
  right: 0;
  top: 0;
  background: #0b3954;
  height: 4px;
  -webkit-transform: translateY(-4px);
  transform: translateY(-4px);
  -webkit-transition-property: transform;
  transition-property: transform;
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -webkit-transition-timing-function: ease-out;
  transition-timing-function: ease-out;
}
.loginLink:hover:before,
.loginLink:focus:before,
.loginLink:active:before {
  -webkit-transform: translateY(0);
  transform: translateY(0);
}

.sessionsLink {
  display: inline-block;
  vertical-align: middle;
  -webkit-transform: perspective(1px) translateZ(0);
  transform: perspective(1px) translateZ(0);
  box-shadow: 0 0 1px rgba(0, 0, 0, 0);
  position: relative;
  overflow: hidden;
}
.sessionsLink:before {
  content: "";
  position: absolute;
  z-index: -1;
  left: 0;
  right: 0;
  top: 0;
  background: #0b3954;
  height: 4px;
  -webkit-transform: translateY(-4px);
  transform: translateY(-4px);
  -webkit-transition-property: transform;
  transition-property: transform;
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -webkit-transition-timing-function: ease-out;
  transition-timing-function: ease-out;
}
.sessionsLink:hover:before,
.sessionsLink:focus:before,
.sessionsLink:active:before {
  -webkit-transform: translateY(0);
  transform: translateY(0);
}
</style>