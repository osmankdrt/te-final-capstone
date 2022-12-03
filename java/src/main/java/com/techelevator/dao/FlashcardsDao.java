package com.techelevator.dao;

import com.techelevator.model.Card;
import com.techelevator.model.Deck;
import java.util.*;

public interface FlashcardsDao {

    List<Deck> listAllDecks();

    List<Card> listAllCards();

    List<Card> listCardsByDeck(int deckID);
}
