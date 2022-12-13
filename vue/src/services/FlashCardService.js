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
   if(confirm('Are you sure you want to delete this entire Deck?'))
    return http.delete(`/decks/${deckID}`)
 },

 updateDeck(deck) {
    return http.put('/decks', deck)
 },
 
 addCard(deckID, card) {
    return http.post(`/decks/${deckID}/cards`, card)
 },

 deleteCard(cardID) {
    return http.delete(`/cards/${cardID}`)
 },

 updateCard(card) {
    return http.put('/cards', card)
 },

 addStudySession(studySession) {
    return http.post(`/studysessions/`, studySession)
 },

 listStudySessionsByUser(userID) {
   return http.get(`/studysessions/${userID}`)
 }

 

}