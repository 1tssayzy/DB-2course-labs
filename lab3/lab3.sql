SELECT * FROM users
WHERE login = 'alice_green';

SELECT * FROM users
WHERE id = 5;

SELECT login FROM users
WHERE id = 6;

SELECT password FROM users
WHERE id = 6 or login = 'frank_white'

SELECT * FROM users
WHERE login LIKE 'a%';

UPDATE users 
SET login = 'zxc_1000-7', avatar = '/uploads/avatars/shadow-fiend.png'
WHERE id = 4;


INSERT INTO users (login,password,avatar) VALUES ('tosik_pupsik','akjdf234d1234d%&^$Gdfasdfas',DEFAULT)
INSERT INTO users (login,password,avatar) VALUES ('tosik_drotik2','fadsfahjksfahsdjkaasdfas',DEFAULT)

DELETE FROM users 
WHERE login = 'tosik_drotik2' and avatar = DEFAULT

DELETE FROM users 
WHERE id = 1 or avatar = DEFAULT

