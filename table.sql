CREATE TYPE oauth_provider AS ENUM (
  'google',
  'facebook'
);
 
CREATE TYPE subscribe_status AS ENUM (
  'active',
  'unsubscribe'
);
 
CREATE TYPE type_transaction AS ENUM (
  'income',
  'expense'  
);
 
CREATE TYPE type_activity_transaction AS ENUM (
  'transfer',
  'topup'  
);
 
CREATE TYPE status_transaction AS ENUM (
  'pending',
  'success',
  'failed'
);


CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  username VARCHAR(35) UNIQUE,
  email VARCHAR(254) UNIQUE NOT NULL,
  hash_password VARCHAR(255) NOT NULL,
  hash_pin VARCHAR(255),
  phone VARCHAR(16) UNIQUE,
  profile_picture_url VARCHAR(255),
  is_verified BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP,
  deleted_at TIMESTAMP                       
);


CREATE TABLE oauth_user (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  provider_name oauth_provider NOT NULL,       
  provider_user_id VARCHAR(255) UNIQUE NOT NULL,
  access_token VARCHAR(255)
  refresh_token VARCHAR(255)
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  expired_at TIMESTAMP

  CONSTRAINT fk_oauth_user FOREIGN KEY (user_id) REFERENCES users (id)
);


CREATE TABLE forgot_password (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  token VARCHAR(255) UNIQUE NOT NULL,
  is_used BOOLEAN  NOT NULL DEFAULT FALSE,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  expired_at TIMESTAMP NOT NULL,

  CONSTRAINT fk_forgot_password_user FOREIGN KEY (user_id) REFERENCES users (id)
);


CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  rating SMALLINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
  comment TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),

  CONSTRAINT fk_reviews_user FOREIGN KEY (user_id) REFERENCES users (id)
);


CREATE TABLE newsletter (
  id SERIAL PRIMARY KEY,
  email VARCHAR(254) NOT NULL UNIQUE,
  status subscribe_status NOT NULL DEFAULT 'active',
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
);


CREATE TABLE wallet (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL UNIQUE,
  balance  NUMERIC(15, 2) NOT NULL DEFAULT 0.00,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL,

  CONSTRAINT fk_wallet_user FOREIGN KEY (user_id) REFERENCES users (id)
);


CREATE TABLE category_payment_method (
  id SERIAL PRIMARY KEY,
  category_name VARCHAR(50) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);


CREATE TABLE payment_method (
  id SERIAL PRIMARY KEY,
  payment_category_id INT NOT NULL,
  name VARCHAR(50) NOT NULL UNIQUE,
  code  VARCHAR(10) NOT NULL UNIQUE,
  fee NUMERIC(15, 2) NOT NULL DEFAULT 0.00,
  logo_url VARCHAR(255),
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),

  CONSTRAINT fk_payment_method_category FOREIGN KEY (payment_category_id) REFERENCES category_payment_method (id)
);


CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  type type_transaction NOT NULL,
  activity_type type_activity_transaction NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),

  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (id),
);

CREATE TABLE transfer_details (
  id SERIAL PRIMARY KEY,
  transaction_id INT NOT NULL UNIQUE,
  user_id INT NOT NULL UNIQUE,
  receiver_id INT NOT NULL,
  amount NUMERIC(15, 2) NOT NULL CHECK (amount > 0),
  description TEXT,
  status status_transaction NOT NULL DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT NOW(),

  CONSTRAINT fk_trasfer_transaction FOREIGN KEY (transaction_id) REFERENCES transactions (id),
  CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT fk_receiver_id FOREIGN KEY (receiver_id) REFERENCES users (id)
)


CREATE TABLE topup_details (
  id SERIAL PRIMARY KEY,
  transaction_id INT NOT NULL UNIQUE,
  user_id INT NOT NULL,
  payment_method_id INT NOT NULL,
  order_amount NUMERIC(15, 2) NOT NULL,         
  delivery_fee NUMERIC(15, 2) NOT NULL DEFAULT 0.00,
  tax_amount NUMERIC(15, 2) NOT NULL DEFAULT 0.00,
  total_amount NUMERIC(15, 2) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),

  CONSTRAINT fk_topup_transaction FOREIGN KEY (transaction_id) REFERENCES transactions (id),
  CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT fk_topup_payment_method FOREIGN KEY (payment_method_id) REFERENCES payment_method (id)
);

CREATE TABLE transfer_contacts (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  favorite_user_id INT NOT NULL, 
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),

  CONSTRAINT uq_transfer_contacts UNIQUE (user_id, favorite_user_id),
  CONSTRAINT fk_tc_user       FOREIGN KEY (user_id) REFERENCES users (id) ,
  CONSTRAINT fk_tc_favorite_user FOREIGN KEY (favorite_user_id) REFERENCES users (id) 
);

