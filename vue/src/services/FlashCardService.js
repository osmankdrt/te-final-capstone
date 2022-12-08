import axios from 'axios';

const http = axios.create({
   baseURL: "http://localhost:9000"
 });


export default {

listDecks() {
   return http.get('/decks')
},

addDecks(deck) {
    return axios.post('/decks', deck)
},

listCards() {
    return http.get('/cards')

 },

 getCardsByDeck(deckID) {
    return http.get(`/decks/${deckID}/cards`)
 },

 deleteDeck(deckID) {
    return http.delete(`/decks/${deckID}`)
 },

 updateDeck(deck) {
    return http.put('/decks', deck)
 }

 

}