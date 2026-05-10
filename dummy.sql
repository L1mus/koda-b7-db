-- users
INSERT INTO users (full_name, username, email, hash_password, hash_pin, phone, profile_picture_url, is_verified, created_at) VALUES
('Ghaluh Wizard', 'ghaluhwizard', 'ghaluh@gmail.com', '$2b$10$abc123hashedpassword1', '$2b$10$abc123hashedpin1', '081234567890', 'https://storage.example.com/photos/ghaluh.jpg', TRUE, '2024-01-01 08:00:00'),
('Robert Fox', 'robertfox', 'robert@gmail.com', '$2b$10$abc123hashedpassword2', '$2b$10$abc123hashedpin2', '081234567891', 'https://storage.example.com/photos/robert.jpg', TRUE, '2024-01-02 09:00:00'),
('Floyd Miles', 'floydmiles', 'floyd@gmail.com', '$2b$10$abc123hashedpassword3', '$2b$10$abc123hashedpin3', '081234567892', 'https://storage.example.com/photos/floyd.jpg', TRUE, '2024-01-03 10:00:00'),
('Ujang Santoso', 'ujangsantoso', 'ujang@gmail.com', '$2b$10$abc123hashedpassword4', '$2b$10$abc123hashedpin4', '081234567893', 'https://storage.example.com/photos/ujang.jpg', TRUE, '2024-01-04 11:00:00'),
('Raulemons Sitorus', 'raulemonsitorus', 'raulemons@gmail.com', '$2b$10$abc123hashedpassword5', '$2b$10$abc123hashedpin5', '081234567894', 'https://storage.example.com/photos/raulemons.jpg', FALSE, '2024-01-05 12:00:00'),
('Reiva Aditya', 'reivaaditya', 'reiva@gmail.com', '$2b$10$abc123hashedpassword6', '$2b$10$abc123hashedpin6', '081234567895', 'https://storage.example.com/photos/reiva.jpg', TRUE, '2024-01-06 13:00:00'),
('Thobie Pranata', 'thobiepranata', 'thobie@gmail.com', '$2b$10$abc123hashedpassword7', '$2b$10$abc123hashedpin7', '081234567896', 'https://storage.example.com/photos/thobie.jpg', TRUE, '2024-01-07 14:00:00'),
('Buzjany Kusuma', 'buzjanykusuma', 'buzjany@gmail.com', '$2b$10$abc123hashedpassword8', '$2b$10$abc123hashedpin8', '081234567897', 'https://storage.example.com/photos/buzjany.jpg', FALSE, '2024-01-08 15:00:00'),
('Adisurya Pratama', 'adisuryapratama', 'adisurya@gmail.com', '$2b$10$abc123hashedpassword9', '$2b$10$abc123hashedpin9', '081234567898', 'https://storage.example.com/photos/adisurya.jpg', TRUE, '2024-01-09 16:00:00'),
('Miguelle Santana', 'miguellesantana', 'miguelle@gmail.com', '$2b$10$abc123hashedpassword10', '$2b$10$abc123hashedpin10', '081234567899', 'https://storage.example.com/photos/miguelle.jpg', TRUE, '2024-01-10 17:00:00');

-- oauth_user
INSERT INTO oauth_user (user_id, provider_name, provider_user_id, created_at) VALUES
(1, 'google', 'google-uid-ghaluh-001', '2024-01-01 08:01:00'),
(2, 'google', 'google-uid-robert-002', '2024-01-02 09:01:00'),
(3, 'facebook', 'fb-uid-floyd-003', '2024-01-03 10:01:00'),
(6, 'google', 'google-uid-reiva-006', '2024-01-06 13:01:00'),
(7, 'facebook', 'fb-uid-thobie-007', '2024-01-07 14:01:00'),
(10, 'google', 'google-uid-miguelle-010', '2024-01-10 17:01:00');

-- forgot_password
INSERT INTO forgot_password (user_id, token, is_used, created_at, expired_at) VALUES
(1, 'token-reset-abc111def222ghi333', FALSE, '2024-03-01 10:00:00', '2024-03-01 10:30:00'),
(2, 'token-reset-bcd222efg333hij444', TRUE, '2024-03-05 11:00:00', '2024-03-05 11:30:00'),
(4, 'token-reset-cde333fgh444ijk555', TRUE, '2024-03-10 09:00:00', '2024-03-10 09:30:00'),
(8, 'token-reset-def444ghi555jkl666', FALSE, '2024-04-01 08:00:00', '2024-04-01 08:30:00'),
(9, 'token-reset-efg555hij666klm777', TRUE, '2024-04-15 14:00:00', '2024-04-15 14:30:00');

-- reviews
INSERT INTO reviews (user_id, rating, comment, created_at) VALUES
(1, 5, 'Aplikasi ini sangat membantu keuangan saya sehari-hari, transfernya cepat dan mudah!', '2024-02-01 10:00:00'),
(2, 5, 'I use Zwallet to manage all financial needs. Its super easy to use and its 100% free app', '2024-02-05 11:00:00'),
(3, 4, 'Since Im using this app, Im not going to move to another similar app. Thank you Zwallet!', '2024-02-10 12:00:00'),
(4, 5, 'Top up cepat, transfer mudah. Sangat recommended untuk semua kalangan!', '2024-02-15 13:00:00'),
(6, 4, 'Fitur favorit kontak sangat berguna, tidak perlu cari-cari nomor setiap mau transfer.', '2024-02-20 14:00:00'),
(7, 5, 'Antarmuka bersih dan tidak ribet. Salah satu e-wallet terbaik yang pernah saya coba.', '2024-02-25 15:00:00'),
(9, 3, 'Bagus tapi terkadang loading agak lama saat jam sibuk. Semoga diperbaiki.', '2024-03-01 09:00:00'),
(10, 5, 'Aman, cepat, dan terpercaya. Sudah 2 tahun pakai dan tidak ada masalah sama sekali.', '2024-03-05 10:00:00'),
(5, 4, 'Pilihan metode top up lengkap, ada BRI, BCA, Gopay, OVO semuanya ada.', '2024-03-10 11:00:00'),
(8, 5, 'Fitur history transaksi sangat membantu saya memantau pengeluaran bulanan.', '2024-03-15 12:00:00');

-- newsletter
INSERT INTO newsletter (email, user_id, status, created_at) VALUES
('ghaluh@gmail.com', 1, 'active', '2024-01-01 08:05:00'),
('robert@gmail.com', 2, 'active', '2024-01-02 09:05:00'),
('floyd@gmail.com', 3, 'unsubscribe', '2024-01-03 10:05:00'),
('ujang@gmail.com', 4, 'active', '2024-01-04 11:05:00'),
('reiva@gmail.com', 6, 'active', '2024-01-06 13:05:00'),
('pengunjung1@yahoo.com', NULL, 'active', '2024-02-01 08:00:00'),
('pengunjung2@hotmail.com', NULL, 'active', '2024-02-15 09:00:00'),
('pengunjung3@outlook.com', NULL, 'unsubscribe', '2024-03-01 10:00:00'),
('thobie@gmail.com', 7, 'active', '2024-01-07 14:05:00'),
('miguelle@gmail.com', 10, 'active', '2024-01-10 17:05:00');

-- wallet
INSERT INTO wallet (user_id, balance, created_at, updated_at) VALUES
(1, 120000.00, '2024-01-01 08:10:00', '2024-04-20 15:00:00'),
(2, 850000.00, '2024-01-02 09:10:00', '2024-04-19 12:00:00'),
(3, 320000.00, '2024-01-03 10:10:00', '2024-04-18 10:00:00'),
(4, 1500000.00, '2024-01-04 11:10:00', '2024-04-17 09:00:00'),
(5, 75000.00, '2024-01-05 12:10:00', '2024-04-16 08:00:00'),
(6, 2300000.00, '2024-01-06 13:10:00', '2024-04-15 14:00:00'),
(7, 450000.00, '2024-01-07 14:10:00', '2024-04-14 13:00:00'),
(8, 90000.00, '2024-01-08 15:10:00', '2024-04-13 11:00:00'),
(9, 670000.00, '2024-01-09 16:10:00', '2024-04-12 10:00:00'),
(10, 1200000.00, '2024-01-10 17:10:00', '2024-04-11 09:00:00');

-- category_payment_method
INSERT INTO category_payment_method (category_name, is_active, created_at) VALUES
('Bank Transfer', TRUE, '2024-01-01 00:00:00'),
('E-Wallet', TRUE, '2024-01-01 00:00:00');

-- payment_method
INSERT INTO payment_method (payment_category_id, name, code, fee, logo_url, is_active, created_at) VALUES
(1, 'Bank Rakyat Indonesia', 'BRI', 2500.00, 'https://storage.example.com/logos/bri.png', TRUE, '2024-01-01 00:00:00'),
(1, 'Bank Central Asia', 'BCA', 2500.00, 'https://storage.example.com/logos/bca.png', TRUE, '2024-01-01 00:00:00'),
(2, 'Dana', 'DANA', 1000.00, 'https://storage.example.com/logos/dana.png', TRUE, '2024-01-01 00:00:00'),
(2, 'Gopay', 'GOPAY', 1000.00, 'https://storage.example.com/logos/gopay.png', TRUE, '2024-01-01 00:00:00'),
(2, 'OVO', 'OVO', 1000.00, 'https://storage.example.com/logos/ovo.png', TRUE, '2024-01-01 00:00:00');

-- transactions
INSERT INTO transactions (sender_id, receiver_id, amount, type, activity_type, status, description, created_at) VALUES
(1, 2, 50000.00, 'debit', 'transfer', 'success', 'Bayar makan siang bareng', '2024-04-14 12:00:00'),
(4, 1, 50000.00, 'credit', 'transfer', 'success', 'Balikin utang kemarin', '2024-04-15 09:00:00'),
(1, 3, 50000.00, 'debit', 'transfer', 'success', 'Transfer bulanan', '2024-04-16 10:00:00'),
(6, 1, 50000.00, 'credit', 'transfer', 'success', 'Patungan kado ulang tahun', '2024-04-17 11:00:00'),
(1, 7, 50000.00, 'debit', 'transfer', 'failed', 'Bayar parkir langganan', '2024-04-18 13:00:00'),
(1, NULL, 40000.00, 'credit', 'topup', 'success', NULL, '2024-04-10 08:00:00'),
(2, NULL, 100000.00, 'credit', 'topup', 'success', NULL, '2024-04-11 09:00:00'),
(4, NULL, 200000.00, 'credit', 'topup', 'success', NULL, '2024-04-12 10:00:00'),
(7, NULL, 50000.00, 'credit', 'topup', 'pending', NULL, '2024-04-13 11:00:00'),
(9, NULL, 150000.00, 'credit', 'topup', 'success', NULL, '2024-04-14 07:00:00');

-- topup_details
INSERT INTO topup_details (transaction_id, payment_method_id, order_amount, delivery_fee, tax_amount, total_amount, created_at) VALUES
(6, 1, 40000.00, 0.00, 4000.00, 44000.00, '2024-04-10 08:00:01'),
(7, 3, 100000.00, 0.00, 10000.00, 110000.00, '2024-04-11 09:00:01'),
(8, 2, 200000.00, 0.00, 20000.00, 220000.00, '2024-04-12 10:00:01'),
(9, 4, 50000.00, 0.00, 5000.00, 55000.00, '2024-04-13 11:00:01'),
(10, 5, 150000.00, 0.00, 15000.00, 165000.00, '2024-04-14 07:00:01');

-- transfer_contacts
INSERT INTO transfer_contacts (user_id, favorite_user_id, created_at) VALUES
(1, 2, '2024-02-01 10:00:00'),
(1, 4, '2024-02-05 11:00:00'),
(1, 6, '2024-02-10 12:00:00'),
(2, 1, '2024-02-15 13:00:00'),
(2, 3, '2024-02-20 14:00:00'),
(4, 1, '2024-02-25 15:00:00'),
(4, 9, '2024-03-01 09:00:00'),
(6, 2, '2024-03-05 10:00:00'),
(7, 1, '2024-03-10 11:00:00'),
(9, 4, '2024-03-15 12:00:00');