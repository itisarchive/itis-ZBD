INSERT INTO country (country_id, country, last_update) VALUES
(1, N'Poland',  '2024-01-01 10:00:00'),
(2, N'Germany', '2024-01-01 10:00:00'),
(3, N'USA',     '2024-01-01 10:00:00'),
(4, N'France',  '2024-01-01 10:00:00'),
(5, N'Italy',   '2024-01-01 10:00:00'),
(6, N'Spain',   '2024-01-01 10:00:00'),
(7, N'UK',      '2024-01-01 10:00:00'),
(8, N'Canada',  '2024-01-01 10:00:00'),
(9, N'Japan',   '2024-01-01 10:00:00'),
(10, N'Australia','2024-01-01 10:00:00');

INSERT INTO city (city_id, city, country_id, last_update) VALUES
(1, N'Warsaw',        1, '2024-01-02 09:00:00'),
(2, N'Krakow',        1, '2024-01-02 09:00:00'),
(3, N'Gdansk',        1, '2024-01-02 09:00:00'),
(4, N'Berlin',        2, '2024-01-02 09:00:00'),
(5, N'Munich',        2, '2024-01-02 09:00:00'),
(6, N'New York',      3, '2024-01-02 09:00:00'),
(7, N'Los Angeles',   3, '2024-01-02 09:00:00'),
(8, N'Paris',         4, '2024-01-02 09:00:00'),
(9, N'London',        7, '2024-01-02 09:00:00'),
(10, N'Toronto',      8, '2024-01-02 09:00:00');

INSERT INTO address (address_id, address, address2, district, city_id, postal_code, phone, last_update) VALUES
(1, N'Marszalkowska 10', N'apt 1',  N'Mazowieckie', 1, N'00-001', N'+48 22 1111111', '2024-01-03 08:00:00'),
(2, N'Florianska 5',    N'',       N'Malopolskie', 2, N'31-001', N'+48 12 2222222', '2024-01-03 08:00:00'),
(3, N'Dluga 20',        N'apt 3',  N'Pomorskie',   3, N'80-001', N'+48 58 3333333', '2024-01-03 08:00:00'),
(4, N'Unter den Linden 1', N'',    N'Berlin',      4, N'10117',  N'+49 30 4444444', '2024-01-03 08:00:00'),
(5, N'Leopoldstrasse 50', N'',     N'Bayern',      5, N'80802',  N'+49 89 5555555', '2024-01-03 08:00:00'),
(6, N'5th Avenue 700',  N'Suite 10', N'NY',        6, N'10019',  N'+1 212 6666666', '2024-01-03 08:00:00'),
(7, N'Hollywood Blvd 99',N'',      N'CA',          7, N'90028',  N'+1 323 7777777', '2024-01-03 08:00:00'),
(8, N'Champs-Élysées 1', N'',      N'Île-de-France',8,N'75008',  N'+33 1 8888888',  '2024-01-03 08:00:00'),
(9, N'Oxford Street 200',N'',      N'Greater London',9,N'W1D 1BT',N'+44 20 9999999','2024-01-03 08:00:00'),
(10,N'King St 15',      N'',       N'Ontario',     10,N'M5H 1A1',N'+1 416 1010101', '2024-01-03 08:00:00');

INSERT INTO store (store_id, manager_staff_id, address_id, last_update) VALUES
(1, NULL, 1, '2024-01-04 10:00:00'),
(2, NULL, 2, '2024-01-04 10:00:00'),
(3, NULL, 4, '2024-01-04 10:00:00'),
(4, NULL, 6, '2024-01-04 10:00:00'),
(5, NULL, 7, '2024-01-04 10:00:00'),
(6, NULL, 8, '2024-01-04 10:00:00'),
(7, NULL, 9, '2024-01-04 10:00:00'),
(8, NULL, 10,'2024-01-04 10:00:00'),
(9, NULL, 3, '2024-01-04 10:00:00'),
(10,NULL, 5, '2024-01-04 10:00:00');

INSERT INTO staff (staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update, picture) VALUES
(1, N'Anna',    N'Kowalska', 1, N'anna.kowalska@example.com', 1, 1, N'akowalska', N'Pass#1', '2024-01-05 09:00:00', NULL),
(2, N'Piotr',   N'Nowak',    2, N'piotr.nowak@example.com',   2, 1, N'pnowak',    N'Pass#2', '2024-01-05 09:00:00', NULL),
(3, N'Marek',   N'Zielinski',3, N'marek.z@example.com',       1, 1, N'mziel',     N'Pass#3', '2024-01-05 09:00:00', NULL),
(4, N'Julia',   N'Schmidt',  4, N'julia.schmidt@example.com', 3, 1, N'jschmidt',  N'Pass#4', '2024-01-05 09:00:00', NULL),
(5, N'Luca',    N'Rossi',    5, N'luca.rossi@example.com',    5, 1, N'lrossi',    N'Pass#5', '2024-01-05 09:00:00', NULL),
(6, N'John',    N'Smith',    6, N'john.smith@example.com',    4, 1, N'jsmith',    N'Pass#6', '2024-01-05 09:00:00', NULL),
(7, N'Emily',   N'Johnson',  7, N'emily.j@example.com',       5, 1, N'ejohnson',  N'Pass#7', '2024-01-05 09:00:00', NULL),
(8, N'Claire',  N'Dupont',   8, N'claire.dupont@example.com', 6, 1, N'cdupont',   N'Pass#8', '2024-01-05 09:00:00', NULL),
(9, N'Oliver',  N'Brown',    9, N'oliver.b@example.com',      7, 1, N'obrown',    N'Pass#9', '2024-01-05 09:00:00', NULL),
(10,N'Sophia',  N'Wilson',  10, N'sophia.w@example.com',      8, 1, N'swilson',   N'Pass#10','2024-01-05 09:00:00', NULL);

INSERT INTO customer (customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active) VALUES
(1, 1, N'Kamil',   N'Wojcik',   N'kamil.w@example.com',   1, 1, '2024-01-06 12:00:00', '2024-01-06 12:00:00', 1),
(2, 1, N'Agnieszka',N'Lewandowska',N'agnieszka.l@example.com',2,1,'2024-01-06 12:05:00','2024-01-06 12:05:00',1),
(3, 2, N'Michal',  N'Kaczmarek',N'michal.k@example.com',  3, 1, '2024-01-06 12:10:00', '2024-01-06 12:10:00', 1),
(4, 3, N'Sven',    N'Muller',   N'sven.m@example.com',    4, 1, '2024-01-06 12:15:00', '2024-01-06 12:15:00', 1),
(5, 4, N'Laura',   N'Bauer',    N'laura.b@example.com',   5, 1, '2024-01-06 12:20:00', '2024-01-06 12:20:00', 1),
(6, 4, N'Adam',    N'Green',    N'adam.g@example.com',    6, 1, '2024-01-06 12:25:00', '2024-01-06 12:25:00', 1),
(7, 5, N'Linda',   N'White',    N'linda.w@example.com',   7, 1, '2024-01-06 12:30:00', '2024-01-06 12:30:00', 1),
(8, 6, N'Pierre',  N'Moreau',   N'pierre.m@example.com',  8, 1, '2024-01-06 12:35:00', '2024-01-06 12:35:00', 1),
(9, 7, N'James',   N'Taylor',   N'james.t@example.com',   9, 1, '2024-01-06 12:40:00', '2024-01-06 12:40:00', 1),
(10,8,N'Natalie',  N'King',     N'natalie.k@example.com',10, 1, '2024-01-06 12:45:00','2024-01-06 12:45:00', 1);

INSERT INTO language (language_id, name, last_update) VALUES
(1, N'English', '2024-01-01 00:00:00'),
(2, N'Polish',  '2024-01-01 00:00:00'),
(3, N'German',  '2024-01-01 00:00:00'),
(4, N'French',  '2024-01-01 00:00:00'),
(5, N'Italian', '2024-01-01 00:00:00'),
(6, N'Spanish', '2024-01-01 00:00:00'),
(7, N'Japanese','2024-01-01 00:00:00'),
(8, N'Chinese', '2024-01-01 00:00:00'),
(9, N'Hindi',   '2024-01-01 00:00:00'),
(10,N'Portuguese','2024-01-01 00:00:00');


INSERT INTO film (film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update, special_features, fulltext) VALUES
(1, N'The Warsaw Mystery', N'Crime story set in Warsaw.', 2020, 1, 5, 2.99, 110, 19.99, N'PG-13', '2024-01-07 10:00:00', N'Trailers,Deleted Scenes', N'warsaw mystery crime story'),
(2, N'Krakow Tales', N'Drama about family in Krakow.', 2019, 2, 4, 2.49, 95,  17.99, N'PG',    '2024-01-07 10:00:00', N'Trailers', N'krakow family drama'),
(3, N'Berlin Nights', N'Romantic comedy in Berlin.',    2021, 3, 6, 3.49, 105, 21.99, N'PG-13', '2024-01-07 10:00:00', N'Commentary', N'berlin romantic comedy'),
(4, N'New York Chase', N'Action movie in New York.',    2018, 1, 3, 3.99, 120, 24.99, N'R',     '2024-01-07 10:00:00', N'Trailers,Commentary', N'action chase new york'),
(5, N'Paris in Love', N'Love story in Paris.',          2022, 4, 7, 4.49, 100, 22.99, N'PG',    '2024-01-07 10:00:00', N'Deleted Scenes', N'romance paris'),
(6, N'London Shadows', N'Mystery thriller in London.',  2017, 1, 5, 2.99, 130, 23.99, N'PG-13', '2024-01-07 10:00:00', N'Trailers', N'london mystery thriller'),
(7, N'Toronto Snow', N'Indie drama in Toronto.',        2020, 1, 4, 1.99, 90,  16.99, N'PG',    '2024-01-07 10:00:00', N'Trailers', N'indie drama toronto'),
(8, N'Tokyo Lights', N'Sci-fi adventure in Tokyo.',     2023, 7, 6, 3.49, 115, 25.99, N'PG-13', '2024-01-07 10:00:00', N'Trailers,Deleted Scenes', N'sci-fi tokyo adventure'),
(9, N'Sydney Waves', N'Surf movie in Sydney.',          2016,10, 5, 2.49, 98,  18.99, N'PG',    '2024-01-07 10:00:00', N'Trailers', N'surf sydney'),
(10,N'Barcelona Dreams', N'Coming-of-age in Barcelona.',2019, 6, 4, 2.99, 102, 19.99, N'PG-13', '2024-01-07 10:00:00', N'Commentary', N'barcelona coming of age');

INSERT INTO actor (actor_id, first_name, last_name, last_update) VALUES
(1, N'Robert',   N'Lewandowski', '2024-01-08 09:00:00'),
(2, N'Zofia',    N'Walesa',      '2024-01-08 09:00:00'),
(3, N'Michael',  N'Jordan',      '2024-01-08 09:00:00'),
(4, N'Emma',     N'Watson',      '2024-01-08 09:00:00'),
(5, N'Brad',     N'Pitt',        '2024-01-08 09:00:00'),
(6, N'Keanu',    N'Reeves',      '2024-01-08 09:00:00'),
(7, N'Natalie',  N'Portman',     '2024-01-08 09:00:00'),
(8, N'Tom',      N'Hanks',       '2024-01-08 09:00:00'),
(9, N'Penelope', N'Cruz',        '2024-01-08 09:00:00'),
(10,N'Ken',      N'Watanabe',    '2024-01-08 09:00:00');

INSERT INTO film_actor (actor_id, film_id, last_update) VALUES
(1, 1, '2024-01-09 10:00:00'),
(2, 2, '2024-01-09 10:00:00'),
(3, 4, '2024-01-09 10:00:00'),
(4, 5, '2024-01-09 10:00:00'),
(5, 4, '2024-01-09 10:00:00'),
(6, 6, '2024-01-09 10:00:00'),
(7, 5, '2024-01-09 10:00:00'),
(8, 3, '2024-01-09 10:00:00'),
(9, 10,'2024-01-09 10:00:00'),
(10,8, '2024-01-09 10:00:00');

INSERT INTO category (category_id, name, last_update) VALUES
(1, N'Action',     '2024-01-01 00:00:00'),
(2, N'Comedy',     '2024-01-01 00:00:00'),
(3, N'Drama',      '2024-01-01 00:00:00'),
(4, N'Romance',    '2024-01-01 00:00:00'),
(5, N'Horror',     '2024-01-01 00:00:00'),
(6, N'Thriller',   '2024-01-01 00:00:00'),
(7, N'Sci-Fi',     '2024-01-01 00:00:00'),
(8, N'Family',     '2024-01-01 00:00:00'),
(9, N'Documentary','2024-01-01 00:00:00'),
(10,N'Sport',      '2024-01-01 00:00:00');

INSERT INTO film_category (film_id, category_id, last_update) VALUES
(1, 3, '2024-01-09 11:00:00'),
(2, 3, '2024-01-09 11:00:00'),
(3, 2, '2024-01-09 11:00:00'),
(4, 1, '2024-01-09 11:00:00'),
(5, 4, '2024-01-09 11:00:00'),
(6, 6, '2024-01-09 11:00:00'),
(7, 3, '2024-01-09 11:00:00'),
(8, 7, '2024-01-09 11:00:00'),
(9, 10,'2024-01-09 11:00:00'),
(10,3, '2024-01-09 11:00:00');

INSERT INTO inventory (inventory_id, film_id, store_id, last_update) VALUES
(1, 1, 1, '2024-01-10 10:00:00'),
(2, 1, 2, '2024-01-10 10:00:00'),
(3, 2, 1, '2024-01-10 10:00:00'),
(4, 3, 3, '2024-01-10 10:00:00'),
(5, 4, 4, '2024-01-10 10:00:00'),
(6, 5, 5, '2024-01-10 10:00:00'),
(7, 6, 6, '2024-01-10 10:00:00'),
(8, 7, 7, '2024-01-10 10:00:00'),
(9, 8, 8, '2024-01-10 10:00:00'),
(10,9, 1, '2024-01-10 10:00:00');

INSERT INTO rental (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update) VALUES
(1, '2024-01-11 14:00:00', 1, 1,  '2024-01-13 16:00:00', 1,  '2024-01-13 16:05:00'),
(2, '2024-01-11 15:00:00', 2, 2,  '2024-01-14 17:00:00', 2,  '2024-01-14 17:10:00'),
(3, '2024-01-12 10:00:00', 3, 3,  '2024-01-15 11:00:00', 3,  '2024-01-15 11:05:00'),
(4, '2024-01-12 11:30:00', 4, 4,  '2024-01-15 12:00:00', 4,  '2024-01-15 12:10:00'),
(5, '2024-01-12 12:00:00', 5, 5,  '2024-01-16 13:00:00', 5,  '2024-01-16 13:05:00'),
(6, '2024-01-13 09:00:00', 6, 6,  '2024-01-17 10:00:00', 6,  '2024-01-17 10:10:00'),
(7, '2024-01-13 10:00:00', 7, 7,  '2024-01-17 11:00:00', 7,  '2024-01-17 11:05:00'),
(8, '2024-01-13 11:00:00', 8, 8,  '2024-01-18 12:00:00', 8,  '2024-01-18 12:10:00'),
(9, '2024-01-14 14:00:00', 9, 9,  '2024-01-19 15:00:00', 9,  '2024-01-19 15:05:00'),
(10,'2024-01-14 15:00:00',10,10,  '2024-01-19 16:00:00', 10, '2024-01-19 16:05:00');

INSERT INTO payment (payment_id, customer_id, staff_id, rental_id, amount, payment_date) VALUES
(1, 1, 1, 1,  5.99, '2024-01-11 14:05:00'),
(2, 2, 2, 2,  4.99, '2024-01-11 15:05:00'),
(3, 3, 3, 3,  3.99, '2024-01-12 10:05:00'),
(4, 4, 4, 4,  6.99, '2024-01-12 11:35:00'),
(5, 5, 5, 5,  7.49, '2024-01-12 12:05:00'),
(6, 6, 6, 6,  4.49, '2024-01-13 09:05:00'),
(7, 7, 7, 7,  3.49, '2024-01-13 10:05:00'),
(8, 8, 8, 8,  5.49, '2024-01-13 11:05:00'),
(9, 9, 9, 9,  2.99, '2024-01-14 14:05:00'),
(10,10,10,10, 6.49, '2024-01-14 15:05:00');
