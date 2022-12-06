import axios from 'axios';


export default {

listDecks() {
   return axios.get('/decks')
},

addDecks() {
    return axios.post('/decks')
},

listCards() {
    return axios.get('/cards')

 },

 getCardsByDeck() {
    return axios.get('/decks/${deckID}/cards')
 }

}