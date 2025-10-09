INSERT INTO users (username, user_login, user_password, bonus_card) VALUES
('Ivan Petrov', 'ivan_p', '12345', TRUE),
('Maria Ivanova', 'masha_i', 'qwerty', FALSE),
('Oleh Kovalenko', 'oleh_k', 'password', TRUE),
('Anna Bondar', 'anna_b', 'abc123', FALSE),
('Dmytro Shevchenko', 'dmytro_s', 'letmein', TRUE);



INSERT INTO rooms (type_room, free_seats, with_bed) VALUES
('Standard', 50, FALSE),
('VIP', 20, TRUE),
('IMAX', 100, FALSE),
('3D', 60, FALSE),
('Luxury', 15, TRUE);



INSERT INTO movies (category, movie_name, rate, oscar, release_date) VALUES
(1, 'Inception', 8.8, TRUE, '2010-07-16'),
(2, 'Avatar', 7.9, TRUE, '2009-12-18'),
(3, 'The Batman', 8.2, FALSE, '2022-03-04'),
(4, 'Oppenheimer', 9.0, TRUE, '2023-07-21'),
(5, 'Interstellar', 8.6, TRUE, '2014-11-07');



INSERT INTO orders (cdate, category, payment, user_id, room_id, movie_id) VALUES
('2025-10-01 19:30:00', 1, TRUE, 1, 1, 1),
('2025-10-02 20:00:00', 2, TRUE, 2, 2, 2),
('2025-10-03 18:00:00', 3, FALSE, 3, 3, 3),
('2025-10-04 21:15:00', 4, TRUE, 4, 4, 4),
('2025-10-05 17:45:00', 5, FALSE, 5, 5, 5);
