BEGIN TRANSACTION;
DROP TABLE card_deck;
DROP TABLE deck;
DROP TABLE card;
CREATE TABLE deck
(
	deck_id serial,
	deck_title varchar(50) NOT NULL,
	deck_description varchar(1000) NOT NULL,
	
	CONSTRAINT pk_deck PRIMARY KEY (deck_id)
);

CREATE TABLE card
(
	card_id serial,
	flashcard_body varchar (1000) NOT NULL,
	
	CONSTRAINT pk_card PRIMARY KEY (card_id)
);

CREATE TABLE card_deck 
(
	deck_id int NOT NULL,
	card_id int NOT NULL,
	
	CONSTRAINT pk_card_deck PRIMARY KEY (deck_id, card_id),
	CONSTRAINT fk_card_deck_deck FOREIGN KEY (deck_id) REFERENCES deck(deck_id),
	CONSTRAINT fk_card_deck_card FOREIGN KEY (card_id) REFERENCES card(card_id)
	
);

INSERT INTO deck (deck_title, deck_description) VALUES ('Deck1', 'This is example 1');
INSERT INTO deck (deck_title, deck_description) VALUES ('Deck2', 'This is example 2');
INSERT INTO deck (deck_title, deck_description) VALUES ('Example2', 'This is example 3');

INSERT INTO card (flashcard_body) VALUES ('Card 1');
INSERT INTO card (flashcard_body) VALUES ('Card 2');
INSERT INTO card (flashcard_body) VALUES ('Card 3');

INSERT INTO card (flashcard_body) VALUES ('Card 4');
INSERT INTO card (flashcard_body) VALUES ('Card 5');
INSERT INTO card (flashcard_body) VALUES ('Card 6');

INSERT INTO card (flashcard_body) VALUES ('Card 7');
INSERT INTO card (flashcard_body) VALUES ('Card 8');
INSERT INTO card (flashcard_body) VALUES ('Card 9');

INSERT INTO card_deck (deck_id, card_id) VALUES (1,1);
INSERT INTO card_deck (deck_id, card_id) VALUES (1,2);
INSERT INTO card_deck (deck_id, card_id) VALUES (1,3);

INSERT INTO card_deck (deck_id, card_id) VALUES (2,4);
INSERT INTO card_deck (deck_id, card_id) VALUES (2,5);
INSERT INTO card_deck (deck_id, card_id) VALUES (2,6);

INSERT INTO card_deck (deck_id, card_id) VALUES (3,7);
INSERT INTO card_deck (deck_id, card_id) VALUES (3,8);
INSERT INTO card_deck (deck_id, card_id) VALUES (3,9);


COMMIT;