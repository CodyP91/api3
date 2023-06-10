-- Procedure to insert a new philosopher
DELIMITER //
CREATE PROCEDURE InsertPhilosopher(IN name_input VARCHAR(255), IN bio_input TEXT, IN date_of_birth_input DATE, IN date_of_death_input DATE, IN image_url_input TEXT)
BEGIN
  INSERT INTO philosopher(name, bio, date_of_birth, date_of_death, image_url) 
  VALUES(name_input, bio_input, date_of_birth_input, date_of_death_input, image_url_input);
  SELECT LAST_INSERT_ID();
END //
DELIMITER ;

-- Procedure to fetch all philosophers
DELIMITER //
CREATE PROCEDURE GetAllPhilosophers()
BEGIN
  SELECT id, name, bio, date_of_birth, date_of_death, image_url FROM philosopher;
END //
DELIMITER ;

-- Procedure to insert a new quote
DELIMITER //
CREATE PROCEDURE InsertQuote(IN philosopher_id_input INT, IN content_input TEXT)
BEGIN
  INSERT INTO quote(philosopher_id, content) VALUES(philosopher_id_input, content_input);
  SELECT LAST_INSERT_ID();
END //
DELIMITER ;

-- Procedure to fetch all quotes of a philosopher
DELIMITER //
CREATE PROCEDURE GetPhilosopherQuotes(IN philosopher_id_input INT)
BEGIN
  SELECT quote.id, quote.content, philosopher.name 
  FROM quote INNER JOIN philosopher 
  ON quote.philosopher_id = philosopher.id 
  WHERE quote.philosopher_id = philosopher_id_input;
END //
DELIMITER ;
