import axios from 'axios';

const http = axios.create({
   baseURL: "http://localhost:9000"
 });


export default {

listDecks() {
   return http.get('/decks')
},

// addDecks() {
//     return axios.post('/decks')
// },

listCards() {
    return http.get('/cards')

 },

 getCardsByDeck(deckID) {
    return http.get(`/decks/${deckID}/cards`)
 },

 

}