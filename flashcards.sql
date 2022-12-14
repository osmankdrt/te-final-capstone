BEGIN TRANSACTION;

DROP TABLE users CASCADE;
DROP TABLE  study_session CASCADE;
DROP TABLE   card CASCADE;
DROP TABLE  deck CASCADE;
DROP TABLE  card_deck CASCADE;



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
	tags varchar(100) NOT NULL,

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

CREATE TABLE study_session
(
    session_id SERIAL,
    user_id int NOT NULL,
    deck_id int NOT NULL,
    question_correct int NOT NULL,
    question_incorrect int NOT NULL,
    total int NOT NULL,


    CONSTRAINT pk_study_session PRIMARY KEY (session_id),
    CONSTRAINT fk_study_session_user FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_study_session_deck FOREIGN KEY (deck_id) REFERENCES deck(deck_id)
);

COMMIT TRANSACTION;
