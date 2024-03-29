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
DELETE FROM study_session
WHERE deck_id = 2;

DELETE FROM card_deck
WHERE card_id BETWEEN 8 AND 14;

DELETE FROM card 
WHERE card_id BETWEEN 8 AND 14;

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

INSERT INTO deck (deck_title, deck_description) VALUES ('Commonly Used Phrases in Somali ', 'Learn common Somali phrases or words to surprise your family');
INSERT INTO deck (deck_title, deck_description) VALUES ('Common Turkish Phrases', 'Learn common Turkish phrases or words to surprise your friends and coworkers');
INSERT INTO deck (deck_title, deck_description) VALUES ('Common Used Phrases in Eritrean ', 'Learn common Eritrean phrases or words to surprise your family');

INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Salaam', 'Hello', '#Somali, #greeting');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Sidee tahay?', 'How are you?', '#Somali, #question');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Magacayga wa', 'My name is: ','#Somali, #introduction');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Subaax wanagsan', 'Good morning','#Somali, #morning, #greeting');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Maacsalaam', 'Goodbye', '#Somali, #departure');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Habeen wanagsan', 'Good night', '#Somali, #night, #departure');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Niin aan shaqayn shaah ma cabbo', 'A man who does not work does not drink tea', '#Somali, #idiom, #phrase');

INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Merhaba', 'Hello','#Turkish, #greeting');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Nasılsın?', 'How are you?','#Turkish, #question');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Hayırlı Sabahlar', 'Good Morning','#Turkish, #morning, #greeting');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Hayırlı Günler!', 'Have a great day!','#Turkish, #departure');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Çok güzel', 'Very Good','#Turkish, #admiration');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Teşekkürler', 'Thanks','#Turkish, #gratification');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('Keçileri Kaçırmak', 'Losing the goats','#Turkish, #idiom, #hasgonecrazy');


INSERT INTO card (flashcard_body, card_title, tags) VALUES ('ከመይ ኣለኻ?', 'How are you?', '#Eritrea, #Question');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('ሽምካ/ኪ መን እዩ?', 'What is your name?','#Eritrea, #Question');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('ስመይ ....' , 'My name is .... ','#Eritrea, #introduction');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('ከመይ ሓዲርካ/ኪ', 'Good morning','#Eritrea, #morning, #greeting');
INSERT INTO card (flashcard_body, card_title, tags) VALUES ('ባህ እተብለካ መዓልቲ ይኹነካ።', 'Have a great day.', '#Eritrea, #departure');


INSERT INTO card_deck (deck_id, card_id) VALUES (1,1);
INSERT INTO card_deck (deck_id, card_id) VALUES (1,2);
INSERT INTO card_deck (deck_id, card_id) VALUES (1,3);
INSERT INTO card_deck (deck_id, card_id) VALUES (1,4);
INSERT INTO card_deck (deck_id, card_id) VALUES (1,5);
INSERT INTO card_deck (deck_id, card_id) VALUES (1,6);
INSERT INTO card_deck (deck_id, card_id) VALUES (1,7);

INSERT INTO card_deck (deck_id, card_id) VALUES (2,8);
INSERT INTO card_deck (deck_id, card_id) VALUES (2,9);
INSERT INTO card_deck (deck_id, card_id) VALUES (2,10);
INSERT INTO card_deck (deck_id, card_id) VALUES (2,11);
INSERT INTO card_deck (deck_id, card_id) VALUES (2,12);
INSERT INTO card_deck (deck_id, card_id) VALUES (2,13);
INSERT INTO card_deck (deck_id, card_id) VALUES (2,14);

INSERT INTO study_session (user_id, deck_id, question_correct, question_incorrect, total) VALUES (1, 1, 2, 2, 4);

INSERT INTO card_deck (deck_id, card_id) VALUES (3,15);
INSERT INTO card_deck (deck_id, card_id) VALUES (3,16);
INSERT INTO card_deck (deck_id, card_id) VALUES (3,17);
INSERT INTO card_deck (deck_id, card_id) VALUES (3,18);
INSERT INTO card_deck (deck_id, card_id) VALUES (3,19);


INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');

INSERT INTO study_session (user_id, deck_id, question_correct, question_incorrect, total) VALUES (1, 1, 2, 2, 4);

COMMIT TRANSACTION;