package com.techelevator.controller;

import com.techelevator.dao.FlashcardsDao;
import com.techelevator.model.Card;
import com.techelevator.model.Deck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin

public class FlashcardsController {

    @Autowired
    private FlashcardsDao dao;

    @RequestMapping(path = "/decks", method = RequestMethod.GET)
     public List<Deck> getDecks() {
        return dao.listAllDecks();
    }

    @RequestMapping(path = "/cards", method = RequestMethod.GET)
     public List<Card> getCards() {
        return dao.listAllCards();
    }

    @RequestMapping(path = "/decks/{deckID}/cards", method = RequestMethod.GET)
    public List<Card> getCardsByDeck(@PathVariable int deckID) {
        return dao.listCardsByDeck(deckID); }
    }
