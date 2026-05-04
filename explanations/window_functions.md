# Explaining window functions

- A window function performs a calculation across a set of rows that are related to the current row — called a window — without collapsing rows like GROUP BY does.
- You still keep every row, but you can look “around” it.
- A window function always has this pattern:
```sql
FUNCTION(...) OVER (...)
```
    - FUNCTION → what you compute
    - OVER → defines the window (rows to look at)
- Common window functions:
    - LAG(): look backward <br>
        ```LAG(temperature) OVER (ORDER BY recordDate)```
    - LEAD(): look forward
    - ROW_NUMBER(): assigns a sequence number
    - RANK() / DENSE_RANK(): ranking with or without gaps
    - SUM(), AVG() as window functions: SUM(temperature) OVER (ORDER BY recordDate)
- Why they’re powerful: 
    - Compare rows (like “yesterday vs today”)
    - Create rankings
    - Compute running totals
    - Analyze trends without losing detail

## Window functions vs GROUP BY
- **GROUP BY**: returns 1 row
```sql
SELECT AVG(temperature) FROM Weather;
```
- **Window function**: returns all rows + average column
```sql
SELECT 
  id,
  temperature,
  AVG(temperature) OVER ()
FROM Weather;
```
- Think of it like this:
    - GROUP BY → collapse data
    - Window function → add insights to each row

## Rising temperature problem
- https://leetcode.com/problems/rising-temperature/?envType=study-plan-v2&envId=top-sql-50

```sql
SELECT id
FROM (
    SELECT 
        id,
        recordDate,
        temperature,
        LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
        LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date
    FROM Weather
) t
WHERE temperature > prev_temp
  AND DATEDIFF(recordDate, prev_date) = 1;
```
- How it works: 
    - LAG(temperature) → gets yesterday’s temperature
    - LAG(recordDate) → gets yesterday’s date
    - OVER (ORDER BY recordDate) → ensures rows are compared in date order
- Why check DATEDIFF = 1
    - Because data might have gaps like: Jan 1 --> Jan 3
    - Without this check, SQL would wrongly compare them as “previous day”. 

