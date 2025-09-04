--Create table to store the codes
CREATE TABLE number_codes (
  sentence_number INTEGER,
  character_number INTEGER,
  message_length INTEGER,
  FOREIGN KEY (sentence_number) REFERENCES sentences(id)
);

--Insert data into number_codes
INSERT INTO number_codes (sentence_number, character_number, message_length)
VALUES
    (14, 98, 4),
    (114, 3, 5),
    (618, 72, 9),
    (630, 7, 3),
    (932, 12, 5),
    (2230, 50, 7),
    (2346, 44, 10),
    (3041, 14, 5);

--Create view: A table with only selected sentences
CREATE VIEW selected_sentences AS
SELECT * FROM number_codes
JOIN sentences ON number_codes.sentence_number = sentences.id;

--Create view: Decode the code, forming the phrase
CREATE VIEW "message" AS
SELECT substring(sentence, character_number, message_length) AS "phrase"
FROM selected_sentences;
