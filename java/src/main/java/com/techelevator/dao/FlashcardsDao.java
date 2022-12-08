package com.techelevator.dao;

import com.techelevator.model.Card;
import com.techelevator.model.CardDeck;
import com.techelevator.model.Deck;
import java.util.*;

public interface FlashcardsDao {

    List<Deck> listAllDecks();

    List<Card> listAllCards();

    List<Card> listCardsByDeck(int deckID);

    int addDeck(Deck deck);

    void addCard(Card card, int deckId);

    void deleteDeck(int deckId);

    void deleteCard(int cardId);

    void updateDeck(Deck deck);

    void updateCard(Card card);


}
