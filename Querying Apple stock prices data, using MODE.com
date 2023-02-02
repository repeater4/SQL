# Using aggregate functions on the Apple stock prices dataset.

/* Veiwing all of the data to gain insight as to its structure */

 SELECT * FROM tutorial.aapl_historical_stock_price

/* Writing a query that determines counts of every single column. */

SELECT COUNT(year) AS year,
       COUNT(month) AS month,
       COUNT(open) AS open,
       COUNT(high) AS high,
       COUNT(low) AS low,
       COUNT(close) AS close,
       COUNT(volume) AS volume
  FROM tutorial.aapl_historical_stock_price
  
/* Writing a query to calculate the average opening price */
  
SELECT SUM(open)/COUNT(open) AS avg_open_price
  FROM tutorial.aapl_historical_stock_price
  
/* selecting the MIN and the MAX from the numerical volume column */
  
  SELECT MIN(volume) AS min_volume,
         MAX(volume) AS max_volume
  FROM tutorial.aapl_historical_stock_price  
  
 /*What was Apple's lowest stock price */
  
  SELECT MIN(low)
  FROM tutorial.aapl_historical_stock_price 
  
 /* What was the highest single-day increase in Apple's share value? */
  
  SELECT MAX(close - open)
   FROM tutorial.aapl_historical_stock_price 
   
 /* Write a query that calculates the average daily trade volume for Apple stock. */
   
   SELECT AVG(volume) AS avg_volume
    FROM tutorial.aapl_historical_stock_price 
  
 /* Counting the number of entries for each year */
    
  SELECT year,
       month,
       COUNT(*) AS count
  FROM tutorial.aapl_historical_stock_price
 GROUP BY year, month
 
 /* Calculating the total number of shares traded each month. Ordered chronologically.*/
  
SELECT year,
       month,
       SUM(volume) AS volume_sum
  FROM tutorial.aapl_historical_stock_price
 GROUP BY year, month
 ORDER BY year, month
 
 /* Calulating the number of transactions per month */
 
 SELECT year,
       month,
       COUNT(*) AS count
  FROM tutorial.aapl_historical_stock_price
 GROUP BY year, month
 ORDER BY month, year
 
 /* Writing a query to calculate the average daily price change in Apple stock, grouped by year. */

SELECT year,
       AVG(close - open) AS avg_daily_change
  FROM tutorial.aapl_historical_stock_price
 GROUP BY 1
 ORDER BY 1
 
 /*  Writing a query that calculates the lowest and highest prices that Apple stock achieved each month.*/
SELECT year,
       month,
       AVG(high) AS highest,
       AVG(low) AS lowest
    FROM tutorial.aapl_historical_stock_price
    GROUP BY 1, 2
    ORDER BY 1, 2
    
/* Finding each month where AAPL stock worked its way over $400 per share */

SELECT year,
       month,
       MAX(high) AS month_high
  FROM tutorial.aapl_historical_stock_price
 GROUP BY year, month
HAVING MAX(high) > 400
 ORDER BY year, month
