CREATE TABLE products (

  ID SERIAL,
  NAME VARCHAR(150),
  PRICE int,
  DESCRIPTION TEXT,
  QUANTITY_IN_STOCK int


);

CREATE TABLE transactions (

  TNUMBER VARCHAR(100),
  TYPE int,
  TDATE DATE,
  PRODUCT_ID int,
  QUANTANTY_PURCHASED int

);