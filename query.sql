--Register
INSERT INTO users (full_name,email,hash_password)
VALUES('Ali Mustadji','limustadji@gmail.com','$2a$12$dIhSe7zGGLcaq2J11YkcE.6Op1N8374bTN7j68rmYYRH9PkWoe5b6')

SELECT email,hash_password
FROM users
WHERE email = 'limustadji@gmail.com'

--Login
SELECT email,hash_pin
FROM users
WHERE email = 'limustadji@gmail.com' AND hash_password = '$2a$12$dIhSe7zGGLcaq2J11YkcE.6Op1N8374bTN7j68rmYYRH9PkWoe5b6'


--Get Login information(username,email,photo)
SELECT full_name as username,email,profile_picture_url
FROM users
WHERE email = 'limustadji@gmail.com' AND hash_password = '$2a$12$dIhSe7zGGLcaq2J11YkcE.6Op1N8374bTN7j68rmYYRH9PkWoe5b6'

--Get pin
SELECT hash_pin
FROM users
WHERE email = 'cameron@gmail.com' 

--Get Transaction history
SELECT s.username as sender,s2.username as receiver, t.amount, t.type, t.activity_type,t.status,t.description
FROM transactions t
JOIN users s ON s.id = t.sender_id
JOIN users s2 ON t.receiver_id = s2.id
WHERE t.sender_id = 1 OR t.receiver_id = 1


--Create Transaction
INSERT INTO transactions (user_id,activity_type)
VALUES (1,'topup')
INSERT INTO topup_details(transactions_id,user_id,payment_method_id,order_amount,delivery_fee,tax_amount,total_amount)
VALUES(1,1,2,40000.00, 0.00, 4000.00, 44000.00)

--Get user profile
SELECT profile_picture_url as photo,full_name,phone,email
FROM users
WHERE id = 1
UPDATE users
SET updated_at = NOW()

--Change Pin
UPDATE users
SET hash_pin = '$2a$12$5MwFK5CF.XsAcmcH1ItM7.zpIYDDymkayw2eHnv9hL8qBaz5Qn/Hu', updated_at = NOW()
WHERE id = 1

--Change Password
UPDATE users
SET hash_password = '$2a$12$X7m8G3g6uQz6T/JmNIykce7xZ4KKNzUDbh2VkGi4vko9czFcGwRXi',updated_at = NOW()
WHERE id = 1

--Change Password
UPDATE users
SET hash_password = '$2a$12$X7m8G3g6uQz6T/JmNIykce7xZ4KKNzUDbh2VkGi4vko9czFcGwRXi',updated_at = NOW()
WHERE id = 1

--Change User Profile 
UPDATE users
SET phone = '085156534946',full_name = 'limus' ,profile_picture_url = 'https://storage.example.com/photos/limus.jpg', updated_at = NOW()
WHERE id = 1

--Get user history income range date
SELECT t.id,t.amount,t.activity_type,t.description,t.created_at,u.full_name AS sender_name,u.phone AS sender_phone,u.profile_picture_url  AS sender_photo
FROM transactions t
JOIN users u ON u.id = t.sender_id
WHERE t.receiver_id = 1 AND t.type = 'credit' AND t.status = 'success' AND t.created_at BETWEEN '2024-04-01' AND '2024-04-30'
ORDER BY t.created_at DESC;

--Get user history expense in range date
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
-- common table expression
WITH user_income AS (
    SELECT SUM(amount) AS total_income
    FROM transactions
    WHERE receiver_id = 1 AND type = 'credit' AND status = 'success'
),
user_expense AS (
    SELECT SUM(amount) AS total_expense
    FROM transactions
    WHERE sender_id = 1 AND type = 'debit' AND status = 'success'
),
user_balance AS (
    SELECT balance
    FROM wallet
    WHERE user_id = 1
)

SELECT u.id,wb.balance,ui.total_income,ue.total_expense
FROM users u,user_balance wb,user_income  ui,user_expense ue
WHERE u.id = 1


-- INCOME — transfer masuk + topup
 
-- transfer yang diterima user 1 bulan ini
SELECT
  t.id,
  t.amount,
  t.activity_type,
  td.description,
  t.created_at,
  u.full_name            AS sender_name,
  u.phone                AS sender_phone,
  u.profile_picture_url  AS sender_photo
FROM transactions t
JOIN transfer_details td ON td.transaction_id = t.id
JOIN users u             ON u.id = t.sender_id
WHERE td.receiver_id = 1
  AND t.status       = 'success'
  AND DATE_TRUNC('month', t.created_at) = DATE_TRUNC('month', NOW())
 
UNION ALL
 
-- topup yang dilakukan user 1 bulan ini
SELECT
  t.id,
  tud.total_amount       AS amount,
  t.activity_type,
  NULL                   AS description,
  t.created_at,
  pm.name                AS sender_name,
  NULL                   AS sender_phone,
  pm.logo_url            AS sender_photo
FROM transactions t
JOIN topup_details tud ON tud.transaction_id = t.id
JOIN payment_method pm ON pm.id = tud.payment_method_id
WHERE t.sender_id      = 1
  AND t.activity_type  = 'topup'
  AND t.status         = 'success'
  AND DATE_TRUNC('month', t.created_at) = DATE_TRUNC('month', NOW())
 
ORDER BY created_at DESC;
 
 
-- EXPENSE — transfer yang dikirim user 1
 
SELECT
  t.id,
  t.amount,
  t.activity_type,
  td.description,
  t.created_at,
  u.full_name            AS receiver_name,
  u.phone                AS receiver_phone,
  u.profile_picture_url  AS receiver_photo
FROM transactions t
JOIN transfer_details td ON td.transaction_id = t.id
JOIN users u             ON u.id = td.receiver_id
WHERE t.sender_id      = 1
  AND t.activity_type  = 'transfer'
  AND t.status         = 'success'
  AND DATE_TRUNC('month', t.created_at) = DATE_TRUNC('month', NOW())
ORDER BY t.created_at DESC;
 
 
--ACCOUNT INFO — balance, total income, total expense
WITH income_transfer AS (
  SELECT COALESCE(SUM(t.amount), 0) AS total
  FROM transactions t
  JOIN transfer_details td ON td.transaction_id = t.id
  WHERE td.receiver_id = 1
    AND t.status       = 'success'
),
income_topup AS (
  SELECT COALESCE(SUM(amount), 0) AS total
  FROM transactions
  WHERE sender_id     = 1
    AND activity_type = 'topup'
    AND status        = 'success'
),
user_expense AS (
  SELECT COALESCE(SUM(amount), 0) AS total
  FROM transactions
  WHERE sender_id     = 1
    AND activity_type = 'transfer'
    AND status        = 'success'
)
 
SELECT
  u.full_name,
  u.email,
  u.phone,
  u.profile_picture_url,
  u.is_verified,
  w.balance,
  (it.total + itu.total) AS total_income,
  ue.total               AS total_expense
FROM users        u
JOIN wallet       w   ON w.user_id = u.id
JOIN income_transfer it ON TRUE
JOIN income_topup    itu ON TRUE
JOIN user_expense    ue  ON TRUE
WHERE u.id         = 1
  AND u.deleted_at IS NULL;
 
 
--FIND RECEIVER WITH PAGINATION
SELECT
  u.id,
  u.full_name,
  u.phone,
  u.profile_picture_url,
  u.is_verified
FROM users u
WHERE u.deleted_at  IS NULL
  AND u.is_verified  = TRUE
  AND u.id          != 1
  AND (
    u.full_name ILIKE '%a%'
    OR u.phone  ILIKE '%a%'
  )
ORDER BY u.full_name ASC
LIMIT  5
OFFSET 0;

--Get Transactions Report
SELECT 
    DATE_TRUNC($2, created_at)::DATE AS period,
    COALESCE(SUM(CASE WHEN type = 'income' THEN amount ELSE 0 END), 0) AS total_income,
    COALESCE(SUM(CASE WHEN type = 'expense' THEN amount ELSE 0 END), 0) AS total_expense
FROM transactions
WHERE user_id = $1 AND status = 'success'
GROUP BY DATE_TRUNC($2, created_at)
ORDER BY period ASC;

--Get User Dashboard Information (Balance, Income, Expense)
SELECT 
    w.balance,
    COALESCE(SUM(CASE WHEN t.type = 'income' AND t.status = 'success' THEN t.amount ELSE 0 END), 0) AS total_income,
    COALESCE(SUM(CASE WHEN t.type = 'expense' AND t.status = 'success' THEN t.amount ELSE 0 END), 0) AS total_expense
FROM wallet w
LEFT JOIN transactions t ON w.user_id = t.user_id
WHERE w.user_id = $1
GROUP BY w.balance
    
--Get Transactions History with Search & Pagination
SELECT 
    t.id AS transaction_id,
    t.amount,
    t.type,
    t.activity_type,
    t.status,
    t.created_at,
    td.description AS transfer_description,
    u_receiver.full_name AS receiver_name,
    pm.name AS payment_method_name
FROM transactions t
LEFT JOIN transfer_details td ON t.id = td.transaction_id
LEFT JOIN users u_receiver ON td.receiver_id = u_receiver.id
LEFT JOIN topup_details tp ON t.id = tp.transaction_id
LEFT JOIN payment_method pm ON tp.payment_method_id = pm.id
WHERE t.user_id = $1
  AND (
      u_receiver.full_name ILIKE '%' || $2 || '%' OR
      pm.name ILIKE '%' || $2 || '%' OR
      td.description ILIKE '%' || $2 || '%'
  )
ORDER BY t.created_at DESC
LIMIT $3 OFFSET $4; 

--Change profile 
UPDATE users
SET 
    full_name = COALESCE($1, full_name),          
    phone = COALESCE($2, phone),              
    profile_picture_url = COALESCE($3, profile_picture_url),
    updated_at = NOW()       
WHERE id = $4;
