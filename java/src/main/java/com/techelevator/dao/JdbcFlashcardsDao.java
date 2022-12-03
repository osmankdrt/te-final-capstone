package com.techelevator.dao;

import com.techelevator.model.Card;
import com.techelevator.model.Deck;
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
}
