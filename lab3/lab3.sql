SELECT * FROM users
WHERE username = 'maria_art';

SELECT * FROM users
WHERE user_id = 5;

SELECT username FROM users
WHERE user_id = 6;  

SELECT password FROM users
WHERE user_id = 6 or username = 'john_travel'

SELECT * FROM users
WHERE username LIKE 'a%';

UPDATE users 
SET username = 'zxc_1000-7', country = 'Germany'
WHERE user_id = 4;

UPDATE users 
SET username = 'zxc_1000-7', country = 'Germany'
WHERE id = 5;


INSERT INTO users (username,email,country) VALUES ('jack_rassel','fladdd123@gmail.com','Ukraine')
INSERT INTO users (username,email,country) VALUES ('basedboss','meepo5nas@gmail.com','Italy')

DELETE FROM users 
WHERE username = 'alex_photo' AND county = 'Ukraine'

DELETE FROM users 
WHERE user_id = 1 

