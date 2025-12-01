# Лабораторна робота 5: Нормалізація бази даних

**Студент:** Вітковський Іван  ІМ-44

---

## 1. Аналіз початкової схеми

### 1.1 Початкові таблиці

**Таблиця `users`:**
```
user_id (PK) | username | email | registration_date | country
```

**Таблиця `posts`:**
```
post_id (PK) | user_id (FK) | caption | likes_count | comments_count | created_at
```

**Таблиця `comments`:**
```
comment_id (PK) | post_id (FK) | user_id (FK) | comment_text | created_at
```

**Таблиця `followers`:**
```
follower_id (FK) | following_id (FK) | followed_at
PRIMARY KEY (follower_id, following_id)
```

---

## 2. Функціональні залежності (ФЗ)

### Таблиця `users`:
```
user_id → username, email, registration_date, country
username → user_id (candidate key)
email → user_id (candidate key)
```

### Таблиця `posts`:
```
post_id → user_id, caption, likes_count, comments_count, created_at
```

### Таблиця `comments`:
```
comment_id → post_id, user_id, comment_text, created_at
```

### Таблиця `followers`:
```
(follower_id, following_id) → followed_at
```

---

## 3. Перевірка нормальних форм

### 3.1 Перевірка 1NF 

**users**: Всі поля атомарні  
**posts**: Всі поля атомарні  
**comments**: Всі поля атомарні  
**followers**: Всі поля атомарні  

**Висновок:** Всі таблиці в 1NF.

---

### 3.2 Перевірка 2NF 

**Критерій:** Таблиця в 1NF + немає часткових залежностей (неключові атрибути залежать від всього первинного ключа).

**users**: PK = `user_id` (простий ключ) → немає часткових залежностей  
**posts**: PK = `post_id` (простий ключ) → немає часткових залежностей  
**comments**: PK = `comment_id` (простий ключ) → немає часткових залежностей  
**followers**: PK = `(follower_id, following_id)` (складений ключ)
   - `followed_at` залежить від усього ключа → немає часткових залежностей

**Висновок:** Всі таблиці в 2NF.

---

### 3.3 Перевірка 3NF

**Критерій:** Таблиця в 2NF + немає транзитивних залежностей (неключові атрибути не залежать від інших неключових атрибутів).

#### Проблема 1: Таблиця `posts`

⚠️ **Виявлена проблема:**
 Поле `comments_count` можна обчислити з інших таблиць:
 `comments_count` можна порахувати з таблиці `comments`

Це **денормалізовані** поля для оптимізації швидкості, але вони створюють **аномалії оновлення**:
- При додаванні коментаря треба оновити `posts.comments_count`
- При видаленні коментаря треба зменшити лічильник
- Можлива неузгодженість даних

**Транзитивна залежність:**
```
post_id → comments (у таблиці comments)
comments → comments_count (підраховується)
post_id → comments_count (транзитивна)
```

Що можно зробити видалити просто коментс каунт и рахувати його динамічно 
Щось типу такого:

```
SELECT p.post_id,COUNT(c.comment_id) as comment_count
FROM posts p
LEFT JOIN comments c ON p.post_id = c.post_id
GROUP BY p.post_id;

```
---
### Результат

 Схема знаходиться в **3NF**:
- Немає повторюваних груп (1NF) 
- Немає часткових залежностей (2NF) 
- Немає транзитивних залежностей (3NF) 
---

## Висновки
Я дослідив свою БД на нормалізацію і надлишковість данних,перевірив чи підходить вона під стандарти 1NF 2NF 3NF (за бажанням можно було додати 4NF), вивчив за що відповідає кожна нормальна форма.  



**Кінець звіту**