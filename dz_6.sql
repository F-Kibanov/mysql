/*
1. Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DROP PROCEDURE IF EXISTS time_converter;
DELIMITER $$
CREATE PROCEDURE time_converter(seconds INT)
BEGIN
    DECLARE days INT default 0;
    DECLARE hours INT default 0;
    DECLARE minutes INT default 0;

    SET days = seconds DIV 86400;
    SET hours = (seconds MOD 86400) DIV 3600;
    SET minutes = (seconds MOD 3600) DIV 60;
    SET seconds = seconds MOD 60;

SELECT days, hours, minutes, seconds;
END $$
DELIMITER ;

CALL time_converter(123456);

-- --------------------------------------------------------------------------------------

/*
2. Выведите только четные числа от 1 до 10 включительно. (Через функцию / процедуру)
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
*/

DROP PROCEDURE IF EXISTS evens;
DELIMITER $$
CREATE PROCEDURE evens()
BEGIN
    DECLARE n INT default 0;
    DROP TABLE IF EXISTS numbers;
    CREATE TABLE numbers (n INT);

    WHILE n < 10 DO
    SET n = n + 2;
    INSERT INTO numbers VALUES(n);
    END WHILE;

SELECT * FROM numbers;
END $$
DELIMITER ;

CALL evens();


















