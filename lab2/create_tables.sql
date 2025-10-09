CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(64) NOT NULL,
    user_login VARCHAR(64) UNIQUE NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    bonus_card BOOLEAN DEFAULT FALSE
);

CREATE TABLE rooms (
    room_id SERIAL PRIMARY KEY,
    type_room VARCHAR(64),
    free_seats INTEGER,
    with_bed BOOLEAN
);

CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    category INT,
    movie_name VARCHAR(64),
    rate FLOAT,
    oscar BOOLEAN,
    release_date TIMESTAMP
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    cdate TIMESTAMP NOT NULL,
    category INT,
    payment BOOLEAN,
    user_id INT REFERENCES users(id),
    room_id INT REFERENCES rooms(room_id),
    movie_id INT REFERENCES movies(id),
    ticket_id SERIAL
);
