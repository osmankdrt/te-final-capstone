package com.techelevator.dao;

import com.techelevator.model.Card;
import com.techelevator.model.Deck;
import com.techelevator.model.StudySession;

import java.util.*;

public interface FlashcardsDao {

    List<Deck> listAllDecks();

    List<Card> listAllCards();

    List<Card> listCardsByDeck(int deckID);

    List<StudySession> listStudySessions(int userID);

    Integer addStudySession(StudySession studySession, int userID);

    int addDeck(Deck deck);

    void addCard(Card card, int deckId);

    void deleteDeck(int deckId);

    void deleteCard(int cardId);

    void updateDeck(Deck deck);

    void updateCard(Card card);


}
