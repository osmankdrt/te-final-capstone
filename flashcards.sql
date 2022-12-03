BEGIN TRANSACTION;

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
	CONSTRAINT fk_card_deck FOREIGN KEY (deck_id) REFERENCES deck(deck_id),
	CONSTRAINT fk_card_deck FOREIGN KEY (card_id) REFERENCES card(card_id)
);