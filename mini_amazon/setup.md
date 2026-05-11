# Mini Amazon E-commerce project step-by-step setup

## Step 0 - prerequisites 
- Get the Docker Desktop for Mac 
- have a locally running postgres db instance 
```
docker run --name pg -d postgres
```
## Step 1: Create Schemas
- Create schema/ecommerce_schema.sql --> contains all CREATE TABLE Queries (structure)
- Create schema/seed_data.sql --> contains all INSERT INTO Queries (data)
    - You need to insert data in the following order:
        ```
        customers → products → orders → order_items → payments
        ```
    - Because of foreign keys.
## Step 2: Create database in psql shell:
```
psql -U postgres            (bash)

CREATE DATABASE ecommerce;  (SQL shell)

\q                          (exit SQL shell)
```
## Step 3: Run ecommerce sql file inside PostgreSQL database
```
psql -U postgres -d ecommerce -f schema/ecommerce_schema.sql
```
- let's break it down: 
    - psql: this is the command-line tool for PostgreSQL, it lets you interact with a database using SQL
    - -U postgres: “Log me in as the postgres user”
            - -U = user
            - postgres = the database user you are logging in as
    - -d ecommerce: “Connect to the ecommerce database”
            - -d = database name
            - ecommerce = the database you created
    - -f schema/ecommerce_schema.sql: “Execute all SQL commands inside this file”
            - -f = file mode
            - runs all SQL inside that file
## Step 4: Run the seed file
```
psql -U postgres -d ecommerce -f schema/seed_data.sql
```
- This will populate all your tables
## Step 5: Verify your data (don't skip this step)
```
psql -U postgres -d ecommerce      (bash)
```
```
ecommerce=# \dt                     (SQL)
             List of tables
 Schema |    Name     | Type  |  Owner   
--------+-------------+-------+----------
 public | customers   | table | postgres
 public | order_items | table | postgres
 public | orders      | table | postgres
 public | payments    | table | postgres
 public | products    | table | postgres
```
## Step 6: Check if data actually exists
- Run simple queries in sql schell:
```sql
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
```
## Next Steps: Your first real analysis 
- revenue_analysis.sql: 
    - Total revenue
    - Top customers
    - Orders with payment status
- run an sql file in sql shell:
```
\i /../sql-interview-prep/mini_amazon/case_studies/revenue_analysis.sql                 (fill path of the sql file)
```
## Pro Tip
- for better viewing db table changes and content, it is recommended to use a postres client such as vscode extension `ckolkman.vscode-postgres`

