BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS card_deck;
DROP TABLE IF EXISTS card;
DROP TABLE IF EXISTS deck;



CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE deck
(
	deck_id serial,
	deck_title varchar(100) NOT NULL,
	deck_description varchar(2500) NOT NULL,

	CONSTRAINT pk_deck PRIMARY KEY (deck_id)
);

CREATE TABLE card
(
	card_id serial,
	card_title varchar(100) NOT NULL,
	flashcard_body varchar (2500) NOT NULL,

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

COMMIT TRANSACTION;
