package com.techelevator.controller;

import com.techelevator.dao.FlashcardsDao;
import com.techelevator.model.Card;
import com.techelevator.model.CardDeck;
import com.techelevator.model.Deck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin

public class FlashcardsController {

    @Autowired
    private FlashcardsDao dao;

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



}
