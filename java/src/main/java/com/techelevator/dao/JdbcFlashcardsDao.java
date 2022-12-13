package com.techelevator.dao;

import com.techelevator.model.Card;
import com.techelevator.model.Deck;
import com.techelevator.model.StudySession;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.ArrayList;
import java.util.List;
@Component
@CrossOrigin
public class JdbcFlashcardsDao implements FlashcardsDao{

    private JdbcTemplate jdbcTemplate;
    public JdbcFlashcardsDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Card> listCardsByDeck(int deckID) {
        List<Card> cards = new ArrayList<>();
        String sql = "SELECT card.card_id, card_title, flashcard_body, tags FROM card " +
                "JOIN card_deck ON card.card_id = card_deck.card_id WHERE deck_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, deckID);

        while (results.next()) {
            Card card = mapRowToCard(results);
            cards.add(card);
        }
        return cards;
    }

    @Override
    public Integer addStudySession(StudySession studySession, int userID) {
        String sql = "INSERT INTO study_session (user_id, deck_id, question_correct, question_incorrect, total) VALUES (?,?,?,?,?) " +
                "RETURNING session_id";
        Integer id = jdbcTemplate.queryForObject(sql, Integer.class, userID, studySession.getDeckID(), studySession.getQuestionCorrect(), studySession.getQuestionIncorrect(), studySession.getTotal());
        return id;
    }

    @Override
    public int addDeck(Deck deck) {
        String sql = "INSERT INTO deck (deck_title, deck_description) VALUES (?,?) RETURNING deck_id";
        Integer id = jdbcTemplate.queryForObject(sql, Integer.class, deck.getDeckTitle(), deck.getdeckDescription());
        return id;
    }


    @Override
    public void addCard(Card card, int deckId) {
        String sql = "INSERT INTO card (card_title , flashcard_body, tags) VALUES (?, ?, ?) RETURNING card_id;";
        Integer cardId = jdbcTemplate.queryForObject(sql, Integer.class, card.getCardTitle(), card.getCardText(), card.getTags());

        String sqlForCardDeck = "INSERT INTO card_deck (deck_id , card_id) VALUES (?,?)";
        jdbcTemplate.update(sqlForCardDeck, deckId, cardId);
    }

    @Override
    public void deleteDeck(int deckId) {
        int firstCardId = firstCardId(deckId);
        int lastCardId = lastCardId(deckId);
        String sqlDeleteFromCardDeck = "DELETE FROM card_deck WHERE card_id BETWEEN ? AND ?";
        jdbcTemplate.update(sqlDeleteFromCardDeck, firstCardId, lastCardId);

        String sqlDeleteFromCard = "DELETE FROM card WHERE card_id BETWEEN ? AND ?";
        jdbcTemplate.update(sqlDeleteFromCard, firstCardId, lastCardId);

        String sqlDeleteDeck = "DELETE FROM deck WHERE deck_id = ?";
        jdbcTemplate.update(sqlDeleteDeck, deckId);
    }

    @Override
    public void deleteCard(int cardId) {

        String sqlDeleteFromCardDeck = "DELETE FROM card_deck WHERE card_id = ?";
        jdbcTemplate.update(sqlDeleteFromCardDeck, cardId);
        String sqlDeleteFromCard = "DELETE FROM card WHERE card_id = ?";
        jdbcTemplate.update(sqlDeleteFromCard,cardId);

    }

    @Override
    public void updateDeck(Deck deck) {
        String sqlUpdateDeckTitle = "UPDATE deck SET deck_title = ? WHERE deck_id = ?";
        jdbcTemplate.update(sqlUpdateDeckTitle, deck.getDeckTitle(), deck.getDeckID());

        String sqlUpdateDeckDescription = "UPDATE deck SET deck_description = ? WHERE deck_id = ?";
        jdbcTemplate.update(sqlUpdateDeckDescription, deck.getdeckDescription(), deck.getDeckID());


    }

    @Override
    public void updateCard(Card card) {
        String sqlUpdateCardsTitle = "UPDATE card SET card_title = ? WHERE card_id = ?";
        jdbcTemplate.update(sqlUpdateCardsTitle, card.getCardTitle(), card.getCardID());

        String sqlUdateCardsText = "UPDATE card SET flashCard_body = ? WHERE card_id =?";
        jdbcTemplate.update(sqlUdateCardsText, card.getCardText(), card.getCardID());

        String sqlUpdateCardsTags = "UPDATE card SET tags = ? WHERE card_id =?";
        jdbcTemplate.update(sqlUpdateCardsTags, card.getTags(), card.getCardID());
    }

    @Override
    public List<Deck> listAllDecks() {
        List<Deck> decks = new ArrayList<>();
        String sql = "SELECT deck_id, deck_title, deck_description FROM deck";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

        while (results.next()) {
            Deck deck = mapRowToDeck(results);
            decks.add(deck);
        }
        return decks;
    }

    @Override
    public List<Card> listAllCards() {
        List<Card> cards = new ArrayList<>();
        String sql = "SELECT card_id, card_title, flashcard_body, tags FROM card";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

        while (results.next()) {
            Card card = mapRowToCard(results);
            cards.add(card);
        }
        return cards;
    }

    public List<StudySession> listStudySessions(int userID) {
        List<StudySession> studySessions = new ArrayList<>();
        String sql = "SELECT session_id, user_id, deck_id, question_correct, question_incorrect, total FROM study_session " +
                "WHERE user_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userID);

        while (results.next()) {
            StudySession studySession = mapRowToStudySession(results);
            studySessions.add(studySession);
        }
        return studySessions;
    }

    private Deck mapRowToDeck(SqlRowSet rowSet) {
        Deck deck = new Deck();

        deck.setDeckID(rowSet.getInt("deck_id"));
        deck.setDeckTitle(rowSet.getString("deck_title"));
        deck.setdeckDescription(rowSet.getString("deck_description"));

        return deck;
    }

    private Card mapRowToCard(SqlRowSet rowSet) {
        Card card = new Card();

        card.setCardID(rowSet.getInt("card_id"));
        card.setCardTitle(rowSet.getString("card_title"));
        card.setCardText(rowSet.getString("flashcard_body"));
        card.setTags(rowSet.getString("tags"));

        return card;
    }

    private StudySession mapRowToStudySession(SqlRowSet rowSet) {
        StudySession studySession = new StudySession();

        studySession.setStudySessionID(rowSet.getInt("session_id"));
        studySession.setUserID(rowSet.getInt("user_id"));
        studySession.setDeckID(rowSet.getInt("deck_id"));
        studySession.setQuestionCorrect(rowSet.getInt("question_correct"));
        studySession.setQuestionIncorrect(rowSet.getInt("question_incorrect"));
        studySession.setTotal(rowSet.getInt("total"));

        return studySession;
    }

    //Selects the first card in the deck
    private int firstCardId(int deckId){
        int firstCard = 0;
        String sql = "SELECT MIN(card.card_id) FROM card " +
                "JOIN card_deck ON card_deck.card_id = card.card_id " +
                "JOIN deck ON card_deck.deck_id = deck.deck_id " +
                "WHERE deck.deck_id = ?";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sql, deckId);
        if(result.next()){
            //column name is min because of the SELECT MIN in SQL Statement
           firstCard = result.getInt("min");
        }
        return firstCard;
    }

    //Selects the last card in the deck
    private int lastCardId(int deckId){
        int lastCard = 0;
        String sql = "SELECT MAX(card.card_id) FROM card " +
                "JOIN card_deck ON card_deck.card_id = card.card_id " +
                "JOIN deck ON card_deck.deck_id = deck.deck_id " +
                "WHERE deck.deck_id = ?";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sql, deckId);
        if(result.next()){
            //column name is max because of the SELECT MAX in SQL statement
            lastCard = result.getInt("max");
        }
        return lastCard;
    }

}
