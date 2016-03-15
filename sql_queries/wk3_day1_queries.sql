/* Test queries for Lighthouse Wk3_Day1

Initiated Draw.io file: https://www.draw.io/#G0B4UiZxD2iS-JTUJJR0p0cTQtSXM
*/

/*
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY */


/* EX 1 Fetch ISBN of all book editions published by 
the publisher "Random House". You should have 3 results. 

/* isbn, edition, publisher */

SELECT e.isbn 
FROM publishers AS p INNER JOIN editions AS e
ON (e.publisher_id = p.id) WHERE (p.name = 'Random House');

/* EX2 */

/* Instead of just their ISBN number, 
fetch their Book Title as well. You should still have the same 
3 results but with more information. But instead of just one column, 
we should have 2 columns in the result set. */

SELECT e.isbn, b.title 
FROM publishers AS p INNER JOIN editions AS e ON (e.publisher_id = p.id)
INNER JOIN books AS b ON (e.book_id = b.id) WHERE (p.name = 'Random House');

/* EX3 */

/* Also include their stock information 
(available stock and retail price for each book edition). 
You should still have the same 3 results but with more information. 
But instead of just 2 columns, we should have 4 columns in the result set. */

SELECT e.isbn, b.title , s.stock, s.retail
FROM publishers AS p INNER JOIN editions AS e ON (e.publisher_id = p.id)
INNER JOIN books AS b ON (e.book_id = b.id) 
INNER JOIN stock AS s ON (s.isbn = e.isbn) 
WHERE (p.name = 'Random House');

/* EX4 */

/* Note how one of the of books has 0 stock. 
Modify the query to only return books that are in stock. */

SELECT e.isbn, b.title , s.stock, s.retail
FROM publishers AS p INNER JOIN editions AS e ON (e.publisher_id = p.id)
INNER JOIN books AS b ON (e.book_id = b.id) 
INNER JOIN stock AS s ON (s.isbn = e.isbn) 
WHERE (p.name = 'Random House')
AND s.stock > 0;

/* EX 5 */
/* Hardcover vs Paperback

Editions has a column called "type". Include the print type but 
instead of just displaying "h" or "p" (the values in the column) 
output the human readable types ("hardcover" and "paperback" accordingly) */

SELECT e.isbn, e.type, b.title , s.stock, s.retail,
CASE WHEN e.type = 'p' THEN 'paperback'
WHEN e.type = 'h' THEN 'hardcover'END
FROM publishers AS p INNER JOIN editions AS e ON (e.publisher_id = p.id)
INNER JOIN books AS b ON (e.book_id = b.id) 
INNER JOIN stock AS s ON (s.isbn = e.isbn) 
WHERE (p.name = 'Random House')
AND s.stock > 0;

/* EX 6 */

/* List all book titles along with their publication dates 
(column on the editions dates) That's 2 columns: "title" and "publication"

Important Notes:

Certain books (such as "Learning Python") don't have any editions 
but we still want to see those books in the results. 
They just shouldn't have a publication date associated with them.
Certain other books (such as "Dune") have multiple editions and 
they will be repeated multiple times in the result set. */

SELECT b.title, e.publication
FROM editions AS e INNER JOIN books AS b ON (b.id = e.book_id)
ORDER BY b.title;

/* EX 7 AGGREGATE FUNCTIONS */

/* What's the total inventory of books in this library 
(i.e. how many total copies are in stock)? */

SELECT SUM(stock) 
FROM stock;

/* EX 8 */
/* | Average Cost | Average Retail | Average Profit |


/* What is the overall average cost and retail price for all books 
for sale? Return three columns "Average cost", "Average Retail" 
and "Average Profit" */

SELECT ROUND(AVG(cost),2) AS Average_Cost, ROUND(AVG(retail),2) AS Average_Retail,
ROUND((AVG(retail)-AVG(cost)),2) AS Average_Profit
FROM stock;

/* Tried solving for weighted average... 

select round(sum(average_rating),2) as Weighted_AVG_Cost from 
(
  Select sum(cost*stock)/
  (
    Select sum(stock) from stock
  ) as average_rating
  from  stock group by isbn
) as Weighted_AVG_Cost; */

/* EX 9 */

/* Which book ID has the most pieces in stock?

Hints:

Use an aggregate function combined with LIMIT and ORDER BY clauses.
No need to join with the books table since 
we just want the ID which is already in the editions table. */

SELECT e.book_id, s.stock
FROM editions AS e INNER JOIN stock AS s ON (e.isbn = s.isbn)
ORDER BY s.stock desc limit 4;

/* EX 10 */

/* List author ID along with the full name and the number of books 
they have written. Output 3 columns: "ID", "Full name" and "Number of Books" */

SELECT a.id, CONCAT(a.first_name, ' ', a.last_name) AS Author_Name, 
COUNT(e.isbn) AS Number_of_Books
FROM authors AS a INNER JOIN books AS b ON (a.id = b.author_id)
INNER JOIN editions AS e ON (e.book_id = b.id)
GROUP BY a.id
ORDER BY a.first_name;

/* EX 11 */

SELECT a.id, CONCAT(a.first_name, ' ', a.last_name) AS Author_Name, 
COUNT(e.isbn) AS Number_of_Books
FROM authors AS a INNER JOIN books AS b ON (a.id = b.author_id)
INNER JOIN editions AS e ON (e.book_id = b.id)
GROUP BY a.id
ORDER BY Number_of_Books desc;

/* EX 12 */
/* Select books that have both paperback and hardcover editions */

Select title from books where id in
(

  select distinct(book_id) from editions where book_id in
  (

    select book_id from editions where type='h' group by book_id, type

  )

  and book_id in
  (

    select book_id from editions where type='p' group by book_id, type
  )
)


/* EX 13 */



















