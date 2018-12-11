/* REED HOSTETLER
   UNIT 2 PROJECT
   PROMOTABLE  */


/*  EXPLORE TABLE */


SHOW COLUMNS FROM CHURN;
SELECT * FROM CHURN LIMIT 10;


/*  EXAMINE DISTRIBUTIONS OF MAIN VARIABLES  */


SELECT MIN(EstimatedSalary), MAX(EstimatedSalary), STDDEV(EstimatedSalary), AVG(EstimatedSalary)
FROM CHURN;

SELECT MIN(CreditScore), MAX(CreditScore), STDDEV(CreditScore), AVG(CreditScore)
FROM CHURN;

SELECT HasCrCard, COUNT(HasCrCard) as Frequency
FROM CHURN
GROUP BY HasCrCard;


/*  CREATE SALARY BRACKET VARIABLE  */


ALTER TABLE CHURN
ADD COLUMN SALBRACKET VARCHAR(30);

UPDATE CHURN
SET SALBRACKET = CASE
WHEN EstimatedSalary BETWEEN 11.58 AND 40000 THEN 1
WHEN EstimatedSalary BETWEEN 40001 AND 80000 THEN 2
WHEN EstimatedSalary BETWEEN 80001 AND 120000 THEN 3
WHEN EstimatedSalary BETWEEN 120001 AND 160000 THEN 4
WHEN EstimatedSalary >= 160001 THEN 5
END;


/*  ANALYSIS  */

SELECT AVG(CreditScore), SALBRACKET
FROM CHURN
GROUP BY SALBRACKET;

SELECT AVG(CreditScore), SALBRACKET
FROM CHURN WHERE HasCrCard = 1
GROUP BY SALBRACKET;
