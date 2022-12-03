import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));

if(currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    activeDeck: 0,
    token: currentToken || '',
    user: currentUser || {},
    decks: [
      {
        id: 1,
        title: 'Deck 1',
        description: 'This is Deck 1',
        cards: [
          {
            title: 'A',
            text: 'Alpha'
          },
          {
            title: 'B',
            text: 'Bravo'
          },
          {
            title: 'C',
            text: 'Charlie'
          },
        ]
      },
      {
        id: 2,
        title: 'Deck 2',
        description: 'This is Deck 2',
        cards: [
          {
            title: 'D',
            text: 'Delta'
          },
          {
            title: 'E',
            text: 'Echo'
          },
          {
            title: 'F',
            text: 'Foxtrot'
          },
        ]
      },
      {
        id: 3,
        title: 'Deck 3',
        description: 'This is Deck 3',
        cards: [
          {
            title: 'G',
            text: 'Golf'
          },
          {
            title: 'H',
            text: 'Hotel'
          },
          {
            title: 'I',
            text: 'India'
          },
        ]
      }
    ]

    
  },
  mutations: {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    },
    SET_ACTIVE_DECK(state, deckID){
      state.activeDeck = deckID;
    }
  },
  getters: {
    card(state) {
      return state.decks.find(p => p.id == state.activeDeck);
    }
  }
})
