CREATE TABLE country
(
    country_id  INT PRIMARY KEY,
    country     NVARCHAR(50),
    last_update DATETIME
);

CREATE TABLE city
(
    city_id     INT PRIMARY KEY,
    city        NVARCHAR(50),
    country_id  INT,
    last_update DATETIME,
    FOREIGN KEY (country_id) REFERENCES country (country_id)
);

CREATE TABLE address
(
    address_id  INT PRIMARY KEY,
    address     NVARCHAR(50),
    address2    NVARCHAR(50),
    district    NVARCHAR(50),
    city_id     INT,
    postal_code NVARCHAR(10),
    phone       NVARCHAR(20),
    last_update DATETIME,
    FOREIGN KEY (city_id) REFERENCES city (city_id)
);

CREATE TABLE store
(
    store_id         INT PRIMARY KEY,
    manager_staff_id INT,
    address_id       INT,
    last_update      DATETIME,
    FOREIGN KEY (address_id) REFERENCES address (address_id)
);

CREATE TABLE staff
(
    staff_id    INT PRIMARY KEY,
    first_name  NVARCHAR(50),
    last_name   NVARCHAR(50),
    address_id  INT,
    email       NVARCHAR(50),
    store_id    INT,
    active      BIT,
    username    NVARCHAR(50),
    password    NVARCHAR(50),
    last_update DATETIME,
    picture     VARBINARY(MAX),
    FOREIGN KEY (address_id) REFERENCES address (address_id),
    FOREIGN KEY (store_id) REFERENCES store (store_id)
);

CREATE TABLE customer
(
    customer_id INT PRIMARY KEY,
    store_id    INT,
    first_name  NVARCHAR(50),
    last_name   NVARCHAR(50),
    email       NVARCHAR(50),
    address_id  INT,
    activebool  BIT,
    create_date DATETIME,
    last_update DATETIME,
    active      INT,
    FOREIGN KEY (store_id) REFERENCES store (store_id),
    FOREIGN KEY (address_id) REFERENCES address (address_id)
);

CREATE TABLE language
(
    language_id INT PRIMARY KEY,
    name        NVARCHAR(50),
    last_update DATETIME
);

CREATE TABLE film
(
    film_id          INT PRIMARY KEY,
    title            NVARCHAR(255),
    description      nvarchar(max),
    release_year     INT,
    language_id      INT,
    rental_duration  TINYINT,
    rental_rate      DECIMAL(4, 2),
    length           SMALLINT,
    replacement_cost DECIMAL(5, 2),
    rating           NVARCHAR(5),
    last_update      DATETIME,
    special_features NVARCHAR(255),
    fulltext         nvarchar(max),
    FOREIGN KEY (language_id) REFERENCES language (language_id)
);

CREATE TABLE actor
(
    actor_id    INT PRIMARY KEY,
    first_name  NVARCHAR(50),
    last_name   NVARCHAR(50),
    last_update DATETIME
);

CREATE TABLE film_actor
(
    actor_id    INT,
    film_id     INT,
    last_update DATETIME,
    PRIMARY KEY (actor_id, film_id),
    FOREIGN KEY (actor_id) REFERENCES actor (actor_id),
    FOREIGN KEY (film_id) REFERENCES film (film_id)
);

CREATE TABLE category
(
    category_id INT PRIMARY KEY,
    name        NVARCHAR(50),
    last_update DATETIME
);

CREATE TABLE film_category
(
    film_id     INT,
    category_id INT,
    last_update DATETIME,
    PRIMARY KEY (film_id, category_id),
    FOREIGN KEY (film_id) REFERENCES film (film_id),
    FOREIGN KEY (category_id) REFERENCES category (category_id)
);

CREATE TABLE inventory
(
    inventory_id INT PRIMARY KEY,
    film_id      INT,
    store_id     INT,
    last_update  DATETIME,
    FOREIGN KEY (film_id) REFERENCES film (film_id),
    FOREIGN KEY (store_id) REFERENCES store (store_id)
);

CREATE TABLE rental
(
    rental_id    INT PRIMARY KEY,
    rental_date  DATETIME,
    inventory_id INT,
    customer_id  INT,
    return_date  DATETIME,
    staff_id     INT,
    last_update  DATETIME,
    FOREIGN KEY (inventory_id) REFERENCES inventory (inventory_id),
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    FOREIGN KEY (staff_id) REFERENCES staff (staff_id)
);

CREATE TABLE payment
(
    payment_id   INT PRIMARY KEY,
    customer_id  INT,
    staff_id     INT,
    rental_id    INT,
    amount       DECIMAL(5, 2),
    payment_date DATETIME,
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    FOREIGN KEY (staff_id) REFERENCES staff (staff_id),
    FOREIGN KEY (rental_id) REFERENCES rental (rental_id)
);

ALTER TABLE store
    ADD FOREIGN KEY (manager_staff_id) REFERENCES staff (staff_id);
