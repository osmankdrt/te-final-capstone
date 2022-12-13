package com.techelevator.controller;

import com.techelevator.dao.FlashcardsDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Card;
import com.techelevator.model.CardDeck;
import com.techelevator.model.Deck;
import com.techelevator.model.StudySession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;
@CrossOrigin
@RestController
public class FlashcardsController {

    @Autowired
    private FlashcardsDao dao;
    @Autowired
    private UserDao userDao;

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/decks", method = RequestMethod.GET)
     public List<Deck> getDecks() {
        return dao.listAllDecks();
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/cards", method = RequestMethod.GET)
     public List<Card> getCards() {
        return dao.listAllCards();
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/decks/{deckID}/cards", method = RequestMethod.GET)
    public List<Card> getCardsByDeck(@PathVariable int deckID) {
        return dao.listCardsByDeck(deckID); }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/studysessions/", method = RequestMethod.GET)
    public List<StudySession> getStudySessions(@RequestBody Principal principal) {
        return dao.listStudySessions(userDao.findIdByUsername(principal.getName()));
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/decks", method = RequestMethod.POST)
    public int addDeck( @RequestBody Deck deck) {
        return dao.addDeck(deck);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/decks/{deckID}/cards", method = RequestMethod.POST)
    public void addCard(@RequestBody Card card , @PathVariable int deckID) {
        dao.addCard(card, deckID);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/studysessions", method = RequestMethod.POST)
    public void addStudySession(@RequestBody StudySession studySession, Principal principal) {
        dao.addStudySession(studySession, userDao.findIdByUsername(principal.getName()));
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(path = "/decks/{deckID}", method = RequestMethod.DELETE)
    public void deleteDeck(@PathVariable int deckID){
        dao.deleteDeck(deckID);
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(path = "/cards/{cardID}", method = RequestMethod.DELETE)
    public void deleteCard(@PathVariable int cardID) {
        dao.deleteCard(cardID);
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/decks" , method = RequestMethod.PUT)
    public void updateDeck (@RequestBody Deck deck){
        dao.updateDeck(deck);
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/cards", method = RequestMethod.PUT)
    public void updateCard(@RequestBody Card card){
        dao.updateCard(card);
    }

}