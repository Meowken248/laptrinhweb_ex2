CREATE DATABASE solution_a;
GO

USE solution_a;
GO

CREATE TABLE users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    user_name VARCHAR(25) NOT NULL,
    user_email VARCHAR(55) NOT NULL,
    user_pass VARCHAR(255) NOT NULL,
    updated_at DATETIME,
    created_at DATETIME
);

CREATE TABLE products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_price DOUBLE PRECISION NOT NULL,
    product_description TEXT NOT NULL,
    updated_at DATETIME,
    created_at DATETIME
);

CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    updated_at DATETIME,
    created_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE order_details (
    order_detail_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    updated_at DATETIME,
    created_at DATETIME,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- 1
SELECT * FROM users
ORDER BY user_name ASC;

-- 2
SELECT TOP 7 * FROM users
ORDER BY user_name ASC;

-- 3
SELECT * FROM users
WHERE user_name LIKE '%a%'
ORDER BY user_name ASC;

-- 4
SELECT * FROM users
WHERE user_name LIKE 'm%';

-- 5
SELECT * FROM users
WHERE user_name LIKE '%i';

-- 6
SELECT * FROM users
WHERE user_email LIKE '%@gmail.com';

-- 7
SELECT * FROM users
WHERE user_email LIKE '%@gmail.com'
AND user_name LIKE 'm%';

-- 8
SELECT * FROM users
WHERE user_email LIKE '%@gmail.com'
AND user_name LIKE '%i%'
AND LEN(user_name) > 5;

-- 9
SELECT * FROM users
WHERE user_name LIKE '%a%'
AND LEN(user_name) BETWEEN 5 AND 9
AND user_email LIKE '%@gmail.com'
AND user_email LIKE '%i%';

-- 10
SELECT * FROM users
WHERE (user_name LIKE '%a%' AND LEN(user_name) BETWEEN 5 AND 9)
OR (user_name LIKE '%i%' AND LEN(user_name) < 9)
OR (user_email LIKE '%@gmail.com' AND user_email LIKE '%i%');
