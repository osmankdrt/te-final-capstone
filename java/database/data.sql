BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO deck (deck_title, deck_description) VALUES ('Jr Dev Interview Questions', 'A collection of common interview questions you can expect in your interviews.');
INSERT INTO deck (deck_title, deck_description) VALUES ('Deck2', 'This is example 2');
INSERT INTO deck (deck_title, deck_description) VALUES ('Deck3', 'This is example 3');
INSERT INTO deck (deck_title, deck_description) VALUES ('Deck4', 'This is example 4');
INSERT INTO deck (deck_title, deck_description) VALUES ('Deck5', 'This is example 5');
INSERT INTO deck (deck_title, deck_description) VALUES ('Deck6', 'This is example 6');



INSERT INTO card (flashcard_body, card_title) VALUES
('Turkey: all of them, US:PB&J, Mexico: Tacos & Burritos, Japan: Noodles & Sushi, Italy: Pasta & Pizza, Greece: none they dont have any good food ',
'Osmans favorite food based on the country & culture');
INSERT INTO card (flashcard_body, card_title) VALUES ('Card Body 2', 'Card Title 2');
INSERT INTO card (flashcard_body, card_title) VALUES ('Card Body 3', 'Card Title 3');
INSERT INTO card (flashcard_body, card_title) VALUES ('Card Body 4', 'Card Title 4');
INSERT INTO card (flashcard_body, card_title) VALUES ('Card Body 5', 'Card Title 5');

INSERT INTO card (flashcard_body, card_title) VALUES ('Card Body 6', 'Card Title 6');
INSERT INTO card (flashcard_body, card_title) VALUES ('Card Body 7', 'Card Title 7');
INSERT INTO card (flashcard_body, card_title) VALUES ('Card Body 8', 'Card Title 8');

INSERT INTO card (flashcard_body, card_title) VALUES ('Card Body 9', 'Card Title 9');
INSERT INTO card (flashcard_body, card_title) VALUES ('Card Body 10', 'Card Title 10');
INSERT INTO card (flashcard_body, card_title) VALUES ('Card Body 11', 'Card Title 11');


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
