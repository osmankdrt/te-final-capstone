--SELECTS ALL CARDS FROM DECK 1
SELECT flashcard_body FROM card_deck JOIN card ON card.card_id = card_deck.card_id;

SELECT deck_id, deck_title, deck_description FROM deck