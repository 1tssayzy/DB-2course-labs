# Лабораторна робота 6: Міграції Схем за Допомогою Prisma ORM
Мета : 
**1.** Використати Prisma ORM для керування схемами та дослідити, як Prisma може аналізувати та змінювати схему вашої бази даних.

**2.** Застосування міграцій, генерування та застосування змін схеми (таблиць, стовпців, зв'язків) за допомогою prisma migrate .

**3.** Моделювання за допомогою файлів схеми Prisma.

**4.** Визначення таблиць та зв'язків у schema.prisma та перегляд їхнього відображення в PostgreSQL.

**5.** Виконати базові запити Prisma, вставити та запитати дані за допомогою клієнта Prisma (через Prisma Studio або простий скрипт) для перевірки змін.
---
## Опис наступних кроків

### 1. Ініціалізація та Інтроспекція Схеми
#### 1.1. Ініціалізація Prisma та Налаштування

Виконані команди для налаштування проєкту та ініціалізації Prisma, а також оновлення змінної DATABASE_URL у файлі .env.

Змінна оточення:
Фрагмент кода
`DATABASE_URL="postgresql://itssayzy:IvanVitkovskiy2006@localhost:5432/itssayzy?schema=public"`
1.2. Інтроспекція Початкової Схеми (npx prisma db pull)

Команда npx prisma db pull проаналізувала існуючу схему бази даних (створену в ЛР 1-5) та записала її у файл prisma/schema.prisma. Це є базовою схемою для подальших міграцій.

Схема до змін (фрагмент users):

Фрагмент кода
// Фрагмент users до додавання поля password

```

model users {
  user_id             Int         @id @default(autoincrement())
  username            String      @db.VarChar(50)
  email               String?     @db.VarChar(100)
  registration_date   DateTime?   @db.Date
  country             String?     @db.VarChar(50)
}
```
### 2. Застосування Міграції: Додавання Поля password
#### 2.1. Редагування schema.prisma

Для забезпечення функціоналу аутентифікації до моделі users було додано нове поле password.

#### 2.2. Запуск Міграції (npx prisma migrate dev)

Через наявність дрейфу схеми (Drift detected) та для чистого старту було виконано скидання бази даних (npx prisma migrate reset), а потім створено та застосовано міграцію.

Команда міграції:

Bash `npx prisma migrate dev --name add-password-to-users`
Вивід термінала, що підтверджує успіх міграції:

Applying migration `20251203134713_add_password_to_users`

The following migration(s) have been created and applied from new schema changes:

`prisma/migrations/`
  `└─ 20251203134713_add_password_to-users/`
    `└─ migration.sql`


Your database is now in sync with your schema.

✔ Generated Prisma Client (6.19.0) to ./src/generated/prisma in 72ms
### 3. Перевірка та Валідація Змін
Для перевірки успішного застосування міграції та можливості взаємодії з новим полем використовувався Prisma Studio. Були вставлені тестові дані, щоб переконатися, що стовпець password коректно відображається та приймає значення.

#### 3.1. Демонстрація Запиту 

Був виконаний тестовий запит для вставки даних у нову структуру:

```
JavaScript
// Код Prisma Client (для демонстрації)
const newUser = await prisma.users.create({ 
    data: { 
        username: 'test_user', 
        email: 'test@mail.com', 
        password: 'hashed_password_123', // Перевірка нового поля
        registration_date: new Date(),
        country: 'Ukraine'
    } 
});
```
const allUsers = await prisma.users.findMany();
Скріншоти поетапного виконання лабораторної роботи 
![image](/lab6/screenshots/Screenshot%202025-12-03%20at%2015.39.43.png)
![image](/lab6/screenshots/Screenshot%202025-12-03%20at%2015.47.33.png)
![image](/lab6/screenshots/Screenshot%202025-12-03%20at%2016.14.54.png)
![image](/lab6/screenshots/Screenshot%202025-12-03%20at%2016.15.04.png)
![image](/lab6/screenshots/Screenshot%202025-12-03%20at%2016.15.13.png)
![image](/lab6/screenshots/Screenshot%202025-12-03%20at%2016.15.21.png)
![image](/lab6/screenshots/Screenshot%202025-12-03%20at%2016.16.31.png)



