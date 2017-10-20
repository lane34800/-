-- 1. SELECTs the names of all products that are not on sale.

SELECT name FROM products WHERE on_sale = 'f';

-- 2. SELECTs the names of all products that cost less than £20.

SELECT name FROM products WHERE price < 20;

-- 3. SELECTs the name and price of the most expensive product.

SELECT name, max(price) FROM products;

or

SELECT name, price FROM products ORDER BY price desc limit 1;

-- 4. SELECTs the name and price of the second most expensive product.

SELECT name, price FROM products ORDER BY price desc limit 1 offset 1;

SELECT max(price), name FROM products WHERE price not in (SELECT max(price, name) FROM products); 

SELECT name, max(price) FROM products WHERE price < (SELECT max(price) FROM products);

-- 5. SELECTs the name and price of the least expensive product.

SELECT name, price FROM products ORDER BY price asc limit 1;

-- 6. SELECTs the names and prices of all products, ordered by price in descending order.

SELECT name, min(price) FROM products;

or

SELECT name, price FROM products ORDER BY price desc;

-- 7. SELECTs the average price of all products.
SELECT avg(price) FROM products;

-- 8. SELECTs the sum of the price of all products.
SELECT sum(price) FROM products;

-- 9. SELECTs the sum of the price of all products whose prices is less than £20.
SELECT sum(price) FROM products WHERE price < 20;

-- 10. SELECTs the id of the user with your name.

SELECT id FROM users WHERE name = 'Gerry Mathe';

-- 11. SELECTs the names of all users whose names start with the letter "E".
SELECT name FROM users WHERE name like 'E%';

-- 12. SELECTs the number of users whose first names are "Benjamin".

SELECT count(id) FROM users WHERE name like 'Benjamin%';

-- 13. SELECTs the number of users who want a "Teddy Bear".

SELECT COUNT(*) FROM wishlists inner join products on products.id = wishlists.product_id WHERE products.name = 'Teddy Bear';

or 

SELECT count(u.id) FROM users u join wishlists w on u.id = w.user_id join products p on w.product_id = p.id WHERE p.name = 'Teddy Bear';


-- 14. SELECTs the count of items on the wishlist of the user with your name.

SELECT count(w.id) FROM wishlists as w join users as u on w.user_id = u.id WHERE u.name = 'Gerry Mathe';

-- 15. SELECTs the count and name of all products on the wishlist, ordered by count in descending order.
SELECT p.name, count(w.id) FROM wishlists AS w JOIN products AS p ON w.product_id = p.id GROUP BY p.name ORDER BY count(w.id) desc;

-- 16. SELECTs the count and name of all products that are not on sale on the wishlist, ordered by count in descending order.

SELECT p.name, count(w.id) FROM wishlists w join products p on w.product_id = p.id WHERE p.on_sale ='f' group by p.name ORDER BY count(w.id) desc;


-- 17. INSERTs a user with the name "Jonathan Anderson" into the users table. 

INSERT into users (name) values ('Jonathan Anderson');

-- 19. INSERTs a wishlist entry for the user with the name "Jonathan Anderson" for the product "The Ruby Programming Language" using sub queries to find the user id and the product id.

INSERT into wishlists (product_id, user_id) values ((SELECT id FROM products WHERE name ='The Ruby Programming Language'), (SELECT id FROM users WHERE name = 'Jonathan Anderson'));


--20. UPDATEs the name of the "Jonathan Anderson" user to be "Jon Anderson".

UPDATE users set name = 'Jon Anderson' WHERE name = 'Jonathan Anderson';

-- 21. DELETEs the user with the name "Jon Anderson".

DELETE FROM users WHERE name = 'Jon Anderson';

-- 22. DELETEs the wishlist item for the user you just DELETEd.

DELETE FROM wishlists WHERE user_id = 26;

    or

DELETE FROM wishlists WHERE created_at = (SELECT max(created_at) FROM wishlists);
