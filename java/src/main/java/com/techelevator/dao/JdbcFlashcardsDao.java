package com.techelevator.dao;

import com.techelevator.model.Card;
import com.techelevator.model.CardDeck;
import com.techelevator.model.Deck;
import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcFlashcardsDao implements FlashcardsDao{

    private JdbcTemplate jdbcTemplate;
    public JdbcFlashcardsDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Card> listCardsByDeck(int deckID) {
        List<Card> cards = new ArrayList<>();
        String sql = "SELECT card.card_id, card_title, flashcard_body FROM card " +
                "JOIN card_deck ON card.card_id = card_deck.card_id WHERE deck_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, deckID);

        while (results.next()) {
            Card card = mapRowToCard(results);
            cards.add(card);
        }
        return cards;
    }

    @Override
    public int addDeck(Deck deck) {
        String sql = "INSERT INTO deck (deck_title, deck_description) VALUES (?,?) RETURNING deck_id";
        Integer id = jdbcTemplate.queryForObject(sql, Integer.class, deck.getDeckTitle(), deck.getdeckDescription());
        return id;
    }


    @Override
    public void addCard(Card card, int deckId) {
        CardDeck cardDeck = new CardDeck();
        String sql = "INSERT INTO card (card_title , flashcard_body) VALUES (?,?) RETURNING card_id;";
        Integer id = jdbcTemplate.queryForObject(sql, Integer.class, card.getCardTitle(), card.getCardText());

        String sqlForCardDeck = "INSERT INTO card_deck (deck_id , card_id) VALUES (?,?)";
        jdbcTemplate.update(sqlForCardDeck, deckId, id);
    }

    @Override
    public void deleteDeck() {
        
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
        String sql = "SELECT card_id, card_title, flashcard_body FROM card";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

        while (results.next()) {
            Card card = mapRowToCard(results);
            cards.add(card);
        }
        return cards;
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

        return card;
    }

    private int firstCardId(int deckId){
        int firstCard = 0;
        String sql = "SELECT MIN(card.card_id) FROM card " +
                "JOIN card_deck ON card_deck.card_id = card.card_id " +
                "JOIN deck ON card_deck.deck_id = deck.deck_id " +
                "WHERE deck.deck_id = ?";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sql, deckId);
        if(result.next()){
           firstCard = result.getInt("card_id");
        }
        return firstCard;
    }

    private int lastCardId(int deckId){
        int lastCard = 0;
        String sql = "SELECT MAX(card.card_id) FROM card " +
                "JOIN card_deck ON card_deck.card_id = card.card_id " +
                "JOIN deck ON card_deck.deck_id = deck.deck_id " +
                "WHERE deck.deck_id = ?";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sql, deckId);
        if(result.next()){
            lastCard = result.getInt("card_id");
        }
        return lastCard;
    }

}
