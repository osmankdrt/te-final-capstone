--SELECTS ALL CARDS FROM DECK 1
SELECT * FROM card_deck JOIN card ON card.card_id = card_deck.card_id WHERE deck_id = 1;


--SELECT THE FIRST CARD IN THE DECK

SELECT MIN(card.card_id) FROM card 
JOIN card_deck ON card_deck.card_id = card.card_id
JOIN deck ON card_deck.deck_id = deck.deck_id
WHERE deck.deck_id = 2

--SELECT THE LAST CARD IN THE DECK

SELECT MAX(card.card_id) FROM card 
JOIN card_deck ON card_deck.card_id = card.card_id
JOIN deck ON card_deck.deck_id = deck.deck_id
WHERE deck.deck_id = 2

--DELETE DECK SQL STATEMENT

DELETE FROM card_deck
WHERE card_id BETWEEN 22 AND 23;

DELETE FROM card 
WHERE card_id BETWEEN 22 AND 23;

DELETE FROM deck
WHERE deck_id = 2


--DELETE CARD SQL STATEMENT

DELETE FROM card_deck
WHERE card_id = 2;

DELETE FROM card 
WHERE card_id = 2;

--UPDATE DECK TITLE

UPDATE deck SET deck_title = 'Deck II'
WHERE deck_id = 2 

--UPDATE DECK DESCRIPTION
UPDATE deck SET deck_description = 'The remainings of an ancient deck from Rome'

SELECT * FROM deck ORDER BY deck_id

--UPDATE CARD TITLE
UPDATE card SET card_title = 'Leonardo DiCaprio' 
WHERE card_id = 3;

SELECT * FROM card

--UPDATE CARD TEXT
UPDATE card SET flashcard_body = 'GAOT' 
WHERE card_id = 3;




SELECT * FROM card






























SELECT * FROM deck


INSERT INTO deck (deck_title, deck_description) VALUES ('Jr Dev Interview Questions', 'A collection of common interview questions you can expect in your interviews.');
INSERT INTO deck (deck_title, deck_description) VALUES ('Deck2', 'This is example 2');
INSERT INTO deck (deck_title, deck_description) VALUES ('Deck3', 'This is example 3');
INSERT INTO deck (deck_title, deck_description) VALUES ('Deck4', 'This is example 4');
INSERT INTO deck (deck_title, deck_description) VALUES ('Deck5', 'This is example 5');
INSERT INTO deck (deck_title, deck_description) VALUES ('Deck6', 'This is example 6');



INSERT INTO card (flashcard_body, card_title, tags) VALUES
('Turkey: all of them, US:PB&J, Mexico: Tacos & Burritos, Japan: Noodles & Sushi, Italy: Pasta & Pizza, Greece: none they dont have any good food ',
'Osmans favorite food based on the country & culture', 'turkish');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Card Title 2','spanish');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Card Body 3', 'Card Title 3', 'french');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Card Body 4', 'Card Title 4', 'japanese');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Card Body 5', 'Card Title 5', 'german');

INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Card Body 6', 'Card Title 6', 'portuguese');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Card Body 7', 'Card Title 7', 'italian');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Card Body 8', 'Card Title 8', 'russian');

INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Card Body 9', 'Card Title 9', 'Mongolian');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Card Body 10', 'Card Title 10', 'arabic');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Card Body 11', 'Card Title 11', 'usa');


INSERT INTO card_deck (deck_id, card_id) VALUES (1,1);
INSERT INTO card_deck (deck_id, card_id) VALUES (1,2);
INSERT INTO card_deck (deck_id, card_id) VALUES (1,3);
INSERT INTO card_deck (deck_id, card_id) VALUES (1,4);
INSERT INTO card_deck (deck_id, card_id) VALUES (1,5);

INSERT INTO card_deck (deck_id, card_id) VALUES (2,6);
INSERT INTO card_deck (deck_id, card_id) VALUES (2,7);
INSERT INTO card_deck (deck_id, card_id) VALUES (2,8);

INSERT INTO card_deck (deck_id, card_id) VALUES (3,9);
INSERT INTO card_deck (deck_id, card_id) VALUES (3,10);
INSERT INTO card_deck (deck_id, card_id) VALUES (3,11);

INSERT INTO card_deck (deck_id, card_id) VALUES (4,1);
INSERT INTO card_deck (deck_id, card_id) VALUES (4,2);
INSERT INTO card_deck (deck_id, card_id) VALUES (4,3);

INSERT INTO card_deck (deck_id, card_id) VALUES (5,4);
INSERT INTO card_deck (deck_id, card_id) VALUES (5,5);
INSERT INTO card_deck (deck_id, card_id) VALUES (5,6);

COMMIT TRANSACTION;