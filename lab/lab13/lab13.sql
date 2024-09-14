.read data.sql


CREATE TABLE average_prices AS
  SELECT category, AVG(MSRP) AS average_price
  FROM products
  GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store, item, MIN(price) as min_price
  FROM inventory
  GROUP BY item;

CREATE TABLE best_product AS
    SELECT name, MIN(MSRP/rating)
    FROM products
    GROUP BY category;

CREATE TABLE shopping_list AS
  SELECT bp.name AS name, lp.store AS store
  FROM best_product AS bp, lowest_prices as lp
  WHERE bp.name = lp.item;



CREATE TABLE total_bandwidth AS
  SELECT SUM(stores.Mbs)
  FROM stores, shopping_list
  WHERE stores.store = shopping_list.store;

