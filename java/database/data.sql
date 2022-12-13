BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO deck (deck_title, deck_description) VALUES ('Commonly Used Phrases in Somali ', 'Learn common Somali phrases or words to surprise your family');
INSERT INTO deck (deck_title, deck_description) VALUES ('Common Turkish Phrases', 'Learn common Turkish phrases or words to surprise your friends and coworkers');


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

INSERT INTO study_session (user_id, deck_id, question_correct, question_incorrect, total, session_time_stamp) VALUES (1, 1, 2, 2, 4, 123.456);


COMMIT TRANSACTION;
