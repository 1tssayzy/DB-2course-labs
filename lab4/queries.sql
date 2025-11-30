-- 1
SELECT COUNT(*) FROM users;
-- 2
SELECT AVG(likes_count) as avarage_likes from POSTS;
-- 3 
SELECT SUM(likes_count) FROM posts;
-- 4  
SELECT MIN(comments_count),MAX(comments_count) from posts;        
-- 5 
SELECT user_id, COUNT(post_id) as count_posts from posts
GROUP BY user_id;
-- 6
SELECT u.username,u.country,AVG(p.likes_count) as avarage_likes  
FROM users u  
JOIN posts p
ON p.user_id = u.user_id
GROUP BY u.username,u.country;
-- 7 тут ще можно було додати ORDER BY count DECS 
SELECT p.post_id, COUNT(c.comment_id) FROM posts p
JOIN comments c
ON c.post_id = p.post_id
GROUP BY p.post_id; 
-- 8  
SELECT u.username, COUNT(f.following_id) from users u 
LEFT JOIN followers f 
ON u.user_id = f.following_id
GROUP BY u.username;
-- 9 
SELECT u.user_id, COUNT(p.post_id)
FROM users u 
LEFT JOIN posts p
ON p.user_id = u.user_id
GROUP BY u.user_id
HAVING COUNT(p.post_id) > 1;

-- 10 
SELECT p.post_id, p.likes_count
FROM posts p
GROUP BY p.post_id
HAVING p.likes_count > (SELECT AVG(likes_count) FROM posts);
-- 11 
SELECT u.country, SUM (p.likes_count) FROM users u
JOIN posts p
ON p.user_id = u.user_id
GROUP BY u.country
HAVING SUM(p.likes_count) > 200;
-- 12 
SELECT p.post_id, c.comment_id, u.username FROM posts p 
INNER JOIN comments c
ON c.post_id = p.post_id
INNER JOIN users u
ON u.user_id = p.user_id

-- 13 
SELECT 
    p.post_id,
    p.caption,
    u.username,
    p.likes_count
FROM users u
RIGHT JOIN posts p ON u.user_id = p.user_id
ORDER BY p.created_at DESC;


