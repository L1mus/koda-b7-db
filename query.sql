--Register
INSERT INTO users (full_name,email,hash_password)
VALUES('Ali Mustadji','limustadji@gmail.com','$2a$12$dIhSe7zGGLcaq2J11YkcE.6Op1N8374bTN7j68rmYYRH9PkWoe5b6')

SELECT email,hash_password
FROM users
WHERE email = 'limustadji@gmail.com'

--Login
SELECT full_name,email,hash_password,hash_pin,phone,profile_picture_url,is_verified
FROM users
WHERE email = 'limustadji@gmail.com' AND hash_password = '$2a$12$dIhSe7zGGLcaq2J11YkcE.6Op1N8374bTN7j68rmYYRH9PkWoe5b6'

--Get Login information(username,email,photo)
SELECT full_name as username,email,hash_password,profile_picture_url
FROM users
WHERE email = 'limustadji@gmail.com' AND hash_password = '$2a$12$dIhSe7zGGLcaq2J11YkcE.6Op1N8374bTN7j68rmYYRH9PkWoe5b6'

--Get pin
SELECT full_name,email,hash_pin
FROM users
WHERE email = 'cameron@gmail.com' 

--Check pin
SELECT full_name,email,hash_pin
FROM users
WHERE hash_pin = '$2b$10$abc123hashedpin11'

--Get Transaction history
SELECT s.username as sender,s2.username as receiver, amount, type, activity_type,status,description
FROM transactions
JOIN users s ON s.id = sender_id
JOIN users s2 ON receiver_id = s2.id
WHERE s.email = 'ghaluh@gmail.com'

--Create Transaction
INSERT INTO transactions (sender_id, receiver_id, amount, type, activity_type, status, description) VALUES
(4, 21, 75000.00, 'credit', 'topup', 'success', 'Bayar patungan makan')

--Create topup
INSERT INTO topup_details (transaction_id, payment_method_id, order_amount, delivery_fee, tax_amount, total_amount) VALUES
(21, 2, 75000.00, 0.00, 7500.00, 82500.00)

--Get user profile
SELECT profile_picture_url as photo,full_name,phone,email
FROM users
WHERE email = 'ghaluh@gmail.com'

--Change Pin
UPDATE users
SET hash_pin = '$2a$12$5MwFK5CF.XsAcmcH1ItM7.zpIYDDymkayw2eHnv9hL8qBaz5Qn/Hu'
WHERE email = 'ghaluh@gmail.com'

--Change Password
UPDATE users
SET hash_password = '$2a$12$X7m8G3g6uQz6T/JmNIykce7xZ4KKNzUDbh2VkGi4vko9czFcGwRXi'
WHERE email = 'limustadji@gmail.com'

--Change Password
UPDATE users
SET hash_password = '$2a$12$X7m8G3g6uQz6T/JmNIykce7xZ4KKNzUDbh2VkGi4vko9czFcGwRXi'
WHERE email = 'limustadji@gmail.com'

--Change User Profile 
UPDATE users
SET phone = '085156534946',full_name = 'limus' ,profile_picture_url = 'https://storage.example.com/photos/limus.jpg'
WHERE email = 'limustadji@gmail.com'

--Get user history income
SELECT t.id,t.amount,t.activity_type,t.description,t.created_at,u.full_name AS sender_name,u.phone AS sender_phone,u.profile_picture_url  AS sender_photo
FROM transactions t
JOIN users u ON u.id = t.sender_id
WHERE t.receiver_id = 1 AND t.type = 'credit' AND t.status = 'success' AND t.created_at BETWEEN '2024-04-01' AND '2024-04-30'
ORDER BY t.created_at DESC;

--Get user history expense
SELECT t.id,t.amount,t.activity_type,t.description,t.created_at,u.full_name AS receiver_name,u.phone AS receiver_phone,u.profile_picture_url AS receiver_photo
FROM transactions t
JOIN users u ON u.id = t.receiver_id
WHERE t.sender_id = 1 AND t.type = 'debit' AND t.status = 'success' AND t.created_at BETWEEN '2024-04-01' AND '2024-04-30'
ORDER BY t.created_at DESC;

--Find receiver with pagination
SELECT u.id,u.full_name,u.phone,u.profile_picture_url
FROM users u
WHERE u.id != 1 AND (u.full_name ILIKE '%a%' OR u.phone ILIKE '%12%')
ORDER BY u.full_name ASC
LIMIT  5
OFFSET 0;

--Get user account information (balance, income, expense)
WITH user_income AS (
    SELECT COALESCE(SUM(amount), 0) AS total_income
    FROM transactions
    WHERE receiver_id = 1 AND type = 'credit' AND status = 'success'
),
user_expense AS (
    SELECT COALESCE(SUM(amount), 0) AS total_expense
    FROM transactions
    WHERE sender_id = 1 AND type = 'debit' AND status = 'success'
),
user_balance AS (
    SELECT balance
    FROM wallet
    WHERE user_id = 1
)

SELECT u.id,u.full_name,u.email,u.phone,u.profile_picture_url,wb.balance,ui.total_income,ue.total_expense
FROM users u
JOIN user_balance wb ON TRUE
JOIN user_income  ui ON TRUE
JOIN user_expense ue ON TRUE
WHERE u.id = 1
