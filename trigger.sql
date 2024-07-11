use dbtheory;

CREATE TABLE items (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);
INSERT INTO items(id, name, price) 
VALUES (1, 'Item', 50.00);

CREATE TABLE item_changes(
    change_id INT PRIMARY KEY AUTO_INCREMENT,
    item_id INT,
    change_type VARCHAR(10),
    change_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (item_id) REFERENCES items(id)
);

DELIMITER //

CREATE TRIGGER update_items_trigger
AFTER UPDATE
ON items
FOR EACH ROW
BEGIN
    INSERT INTO item_changes (item_id, change_type)
    VALUES (NEW.id, 'UPDATE');
END;
//

DELIMITER ;

UPDATE items
SET price = 60.00 
WHERE id = 1;

SELECT * FROM item_changes;