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


-- users (11-20)
INSERT INTO users (full_name, username, email, hash_password, hash_pin, phone, profile_picture_url, is_verified, created_at) VALUES
('Cameron Williamson', 'cameronwilliamson', 'cameron@gmail.com', '$2b$10$abc123hashedpassword11', '$2b$10$abc123hashedpin11', '081234567900', 'https://storage.example.com/photos/cameron.jpg', TRUE, '2024-01-11 08:00:00'),
('Cody Fisher', 'codyfisher', 'cody@gmail.com', '$2b$10$abc123hashedpassword12', '$2b$10$abc123hashedpin12', '081234567901', 'https://storage.example.com/photos/cody.jpg', TRUE, '2024-01-12 09:00:00'),
('Kristin Watson', 'kristinwatson', 'kristin@gmail.com', '$2b$10$abc123hashedpassword13', '$2b$10$abc123hashedpin13', '081234567902', 'https://storage.example.com/photos/kristin.jpg', FALSE, '2024-01-13 10:00:00'),
('Wade Warren', 'wadewarren', 'wade@gmail.com', '$2b$10$abc123hashedpassword14', '$2b$10$abc123hashedpin14', '081234567903', 'https://storage.example.com/photos/wade.jpg', TRUE, '2024-01-14 11:00:00'),
('Savannah Nguyen', 'savannahnguyen', 'savannah@gmail.com', '$2b$10$abc123hashedpassword15', '$2b$10$abc123hashedpin15', '081234567904', 'https://storage.example.com/photos/savannah.jpg', TRUE, '2024-01-15 12:00:00'),
('Sherina Claw', 'sherinaclaw', 'sherina@gmail.com', '$2b$10$abc123hashedpassword16', '$2b$10$abc123hashedpin16', '081234567905', 'https://storage.example.com/photos/sherina.jpg', TRUE, '2024-01-16 13:00:00'),
('James Bond', 'jamesbond', 'james@gmail.com', '$2b$10$abc123hashedpassword17', '$2b$10$abc123hashedpin17', '081234567906', 'https://storage.example.com/photos/james.jpg', TRUE, '2024-01-17 14:00:00'),
('Ujang Kayu', 'ujangkayu', 'ujangkayu@gmail.com', '$2b$10$abc123hashedpassword18', '$2b$10$abc123hashedpin18', '081234567907', 'https://storage.example.com/photos/ujangkayu.jpg', FALSE, '2024-01-18 15:00:00'),
('Budi Santoso', 'budisantoso', 'budi@gmail.com', '$2b$10$abc123hashedpassword19', '$2b$10$abc123hashedpin19', '081234567908', 'https://storage.example.com/photos/budi.jpg', TRUE, '2024-01-19 16:00:00'),
('Siti Rahayu', 'sitirahayu', 'siti@gmail.com', '$2b$10$abc123hashedpassword20', '$2b$10$abc123hashedpin20', '081234567909', 'https://storage.example.com/photos/siti.jpg', TRUE, '2024-01-20 17:00:00');

-- oauth_user (7-12)
INSERT INTO oauth_user (user_id, provider_name, provider_user_id, created_at) VALUES
(11, 'google', 'google-uid-cameron-011', '2024-01-11 08:01:00'),
(12, 'facebook', 'fb-uid-cody-012', '2024-01-12 09:01:00'),
(14, 'google', 'google-uid-wade-014', '2024-01-14 11:01:00'),
(15, 'facebook', 'fb-uid-savannah-015', '2024-01-15 12:01:00'),
(16, 'google', 'google-uid-sherina-016', '2024-01-16 13:01:00'),
(17, 'google', 'google-uid-james-017', '2024-01-17 14:01:00'),
(19, 'facebook', 'fb-uid-budi-019', '2024-01-19 16:01:00'),
(20, 'google', 'google-uid-siti-020', '2024-01-20 17:01:00'),
(13, 'facebook', 'fb-uid-kristin-013', '2024-01-13 10:01:00'),
(18, 'google', 'google-uid-ujangkayu-018', '2024-01-18 15:01:00');

-- forgot_password (6-15)
INSERT INTO forgot_password (user_id, token, is_used, created_at, expired_at) VALUES
(11, 'token-reset-fgh666hij777klm888', TRUE, '2024-04-01 08:00:00', '2024-04-01 08:30:00'),
(12, 'token-reset-ghi777ijk888lmn999', FALSE, '2024-04-05 09:00:00', '2024-04-05 09:30:00'),
(13, 'token-reset-hij888jkl999mno000', TRUE, '2024-04-08 10:00:00', '2024-04-08 10:30:00'),
(15, 'token-reset-ijk999klm000nop111', FALSE, '2024-04-10 11:00:00', '2024-04-10 11:30:00'),
(16, 'token-reset-jkl000lmn111opq222', TRUE, '2024-04-12 12:00:00', '2024-04-12 12:30:00'),
(17, 'token-reset-klm111mno222pqr333', FALSE, '2024-04-14 13:00:00', '2024-04-14 13:30:00'),
(18, 'token-reset-lmn222nop333qrs444', TRUE, '2024-04-16 14:00:00', '2024-04-16 14:30:00'),
(19, 'token-reset-mno333opq444rst555', FALSE, '2024-04-18 15:00:00', '2024-04-18 15:30:00'),
(20, 'token-reset-nop444pqr555stu666', TRUE, '2024-04-20 16:00:00', '2024-04-20 16:30:00'),
(14, 'token-reset-opq555qrs666tuv777', FALSE, '2024-04-22 17:00:00', '2024-04-22 17:30:00');

-- reviews (11-20)
INSERT INTO reviews (user_id, rating, comment, created_at) VALUES
(11, 5, 'Cameron di sini, transfer ke luar kota jadi gampang banget pakai Zwallet!', '2024-03-20 08:00:00'),
(12, 4, 'Aplikasi ringan dan tidak makan banyak data. Cocok untuk HP kentang sekalipun.', '2024-03-22 09:00:00'),
(13, 3, 'Tampilannya bagus tapi butuh fitur notifikasi yang lebih informatif.', '2024-03-24 10:00:00'),
(14, 5, 'Top up via BCA paling cepat prosesnya, hitungan detik langsung masuk.', '2024-03-26 11:00:00'),
(15, 5, 'Suka banget fitur bintang favorit, kontak langganan jadi mudah ditemukan.', '2024-03-28 12:00:00'),
(16, 4, 'Sherina di sini! Sudah 1 tahun pakai, belum pernah ada transaksi yang bermasalah.', '2024-03-30 13:00:00'),
(17, 5, 'James Bond approved! Keamanan PIN-nya bikin tenang, transaksi aman terjaga.', '2024-04-01 14:00:00'),
(19, 4, 'Riwayat transaksi bisa dicari pakai nama, sangat membantu untuk rekap bulanan.', '2024-04-03 15:00:00'),
(20, 5, 'Proses daftar cepat, verifikasi email langsung. Langsung bisa transfer hari itu juga.', '2024-04-05 16:00:00'),
(18, 2, 'Masih ada bug di halaman top up kalau sinyal lemah. Semoga segera diperbaiki.', '2024-04-07 17:00:00');

-- newsletter (11-20)
INSERT INTO newsletter (email, user_id, status, created_at) VALUES
('cameron@gmail.com', 11, 'active', '2024-01-11 08:05:00'),
('cody@gmail.com', 12, 'unsubscribe', '2024-01-12 09:05:00'),
('kristin@gmail.com', 13, 'active', '2024-01-13 10:05:00'),
('wade@gmail.com', 14, 'active', '2024-01-14 11:05:00'),
('savannah@gmail.com', 15, 'active', '2024-01-15 12:05:00'),
('pengunjung4@gmail.com', NULL, 'active', '2024-04-01 08:00:00'),
('pengunjung5@yahoo.com', NULL, 'unsubscribe', '2024-04-05 09:00:00'),
('pengunjung6@outlook.com', NULL, 'active', '2024-04-10 10:00:00'),
('budi@gmail.com', 19, 'active', '2024-01-19 16:05:00'),
('siti@gmail.com', 20, 'active', '2024-01-20 17:05:00');

-- wallet (11-20)
INSERT INTO wallet (user_id, balance, created_at, updated_at) VALUES
(11, 500000.00, '2024-01-11 08:10:00', '2024-04-20 08:00:00'),
(12, 275000.00, '2024-01-12 09:10:00', '2024-04-19 09:00:00'),
(13, 1800000.00, '2024-01-13 10:10:00', '2024-04-18 10:00:00'),
(14, 430000.00, '2024-01-14 11:10:00', '2024-04-17 11:00:00'),
(15, 3200000.00, '2024-01-15 12:10:00', '2024-04-16 12:00:00'),
(16, 650000.00, '2024-01-16 13:10:00', '2024-04-15 13:00:00'),
(17, 980000.00, '2024-01-17 14:10:00', '2024-04-14 14:00:00'),
(18, 125000.00, '2024-01-18 15:10:00', '2024-04-13 15:00:00'),
(19, 760000.00, '2024-01-19 16:10:00', '2024-04-12 16:00:00'),
(20, 2100000.00, '2024-01-20 17:10:00', '2024-04-11 17:00:00');

-- transactions (11-20) — 5 transfer + 5 topup
INSERT INTO transactions (sender_id, receiver_id, amount, type, activity_type, status, description, created_at) VALUES
(11, 1, 75000.00, 'debit', 'transfer', 'success', 'Bayar patungan makan', '2024-04-19 08:00:00'),
(1, 11, 75000.00, 'credit', 'transfer', 'success', 'Bayar patungan makan', '2024-04-19 08:00:01'),
(12, 3, 120000.00, 'debit', 'transfer', 'success', 'Balikin pinjaman kemarin', '2024-04-19 09:00:00'),
(15, 7, 200000.00, 'debit', 'transfer', 'failed', 'Transfer arisan bulanan', '2024-04-19 10:00:00'),
(20, 9, 50000.00, 'debit', 'transfer', 'success', 'Bayar tiket nonton', '2024-04-19 11:00:00'),
(11, NULL, 250000.00, 'credit', 'topup', 'success', NULL, '2024-04-19 07:00:00'),
(13, NULL, 500000.00, 'credit', 'topup', 'success', NULL, '2024-04-19 07:30:00'),
(15, NULL, 100000.00, 'credit', 'topup', 'pending', NULL, '2024-04-19 08:00:00'),
(17, NULL, 300000.00, 'credit', 'topup', 'success', NULL, '2024-04-19 09:00:00'),
(20, NULL, 75000.00, 'credit', 'topup', 'success', NULL, '2024-04-19 10:00:00');

-- topup_details (transaction_id 16-20 adalah topup)
INSERT INTO topup_details (transaction_id, payment_method_id, order_amount, delivery_fee, tax_amount, total_amount, created_at) VALUES
(16, 2, 250000.00, 0.00, 25000.00, 275000.00, '2024-04-19 07:00:01'),
(17, 1, 500000.00, 0.00, 50000.00, 550000.00, '2024-04-19 07:30:01'),
(18, 4, 100000.00, 0.00, 10000.00, 110000.00, '2024-04-19 08:00:01'),
(19, 3, 300000.00, 0.00, 30000.00, 330000.00, '2024-04-19 09:00:01'),
(20, 5, 75000.00, 0.00, 7500.00, 82500.00, '2024-04-19 10:00:01');

-- transfer_contacts (11-20)
INSERT INTO transfer_contacts (user_id, favorite_user_id, created_at) VALUES
(11, 1, '2024-03-20 08:00:00'),
(11, 3, '2024-03-21 09:00:00'),
(12, 4, '2024-03-22 10:00:00'),
(13, 2, '2024-03-23 11:00:00'),
(14, 6, '2024-03-24 12:00:00'),
(15, 1, '2024-03-25 13:00:00'),
(16, 9, '2024-03-26 14:00:00'),
(17, 10, '2024-03-27 15:00:00'),
(19, 11, '2024-03-28 16:00:00'),
(20, 5, '2024-03-29 17:00:00');