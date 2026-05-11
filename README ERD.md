Table users {
id serial [primary key]
full_name varchar(100) [not null]
email varchar(254) [unique,not null]
hash_password varchar(255) [not null]
phone varchar (16) [unique]
hash_pin varchar(255)
profile_picture_url varchar(255)
isVerified boolean [default: false]
created_at timestamp [default: `NOW()`]
updated_at timestamp
deleted_at timestamp
}

Enum oauth_provider {
google
facebook
}

Table oauth_user {
id serial [primary key]
user_id int [not null]
provider_user_id varchar(255) [unique]
provider_name oauth_provider [not null]
access_token varchar(255)
refresh_token varchar(255)
created_at timestamp [default: 'NOW()']
expired_at timestamp
}

Table forgot_password{
id serial [primary key]
user_id int [not null]
token varchar(255) [unique]
isUsed boolean
created_at timestamp [default: 'NOW()']
expired_at timestamp
}

Table reviews {
id serial [primary key]
user_id int [not null]
rating int [not null]
comment text
created_at timestamp [default: 'NOW()']
}

Enum subscribe_status {
active
unsubscribe
}

Table newsletter{
id serial [primary key]
email varchar(254)
status subscribe_status
created_at timestamp [default: 'NOW()']
}

Table wallet {
id serial [primary key]
user_id int [not null,unique]
balance numeric(15,2)
created_at timestamp [default: 'NOW()']
updated_at timestamp
}

Enum type_transaction {
income
expense
}

Enum type_activity_transaction {
transfer
topup
}

Enum status_transaction {
pending
success
failed
}

Table transactions {
id serial [primary key]
user_id int [not null]
type type_transaction
activity_type type_activity_transaction
created_at timestamp [default: 'NOW()']
}

Table transfer_details{
id serial [primary key]
transaction_id int [not null]
user_id int [not null]
receiver_id int [not null]
amount numeric(15,2)
decriptions text
status status_transaction
created_at timestamp [default: 'NOW()']
}

Table topup_details {
id serial [primary key]
transaction_id int [not null, unique]
user_id int [not null]
payment_method_id int [not null]
order_amount numeric(15,2)
delivery_fee numeric(15,2) [default: 0]
tax_amount numeric(15,2)
total_amount numeric(15,2)
created_at timestamp [default: 'NOW()']
}

Table transfer_contacts {
id serial [primary key]
user_id int [not null]
favorite_user_id int [not null]
created_at timestamp [default: 'NOW()']
}

Table category_payment_method{
id serial [primary key]
category_name varchar(20)
}

Table payment_method {
id serial [primary key]
payment_category_id int [not null]
name varchar(50) [unique]
code varchar(10) [unique]
fee numeric
logo_url varchar(255)
isActive boolean
}

Ref: oauth_user.user_id > users.id // one-to-many banyak oauth per user (google + fb)
Ref: forgot_password.user_id > users.id // one-to-many banyak request reset per user
Ref: wallet.user_id - users.id // one-to-one: 1 user = 1 wallet

Ref: reviews.user_id > users.id // one-to-many banyak reviews per user

Ref: transfer_contacts.user_id > users.id // one-to-many 1 user dapat memiliki banyak user yang di favoritkan
Ref: transfer_contacts.favorite_user_id > users.id // one-to-many 1 user bisa di favorite user lain

Ref: payment_method.payment_category_id > category_payment_method.id // one-to-many 1 kategory pembayaran bisa berisi banyak metode pembayaran yang berbeda

Ref: topup_details.transaction_id - transactions.id // one-to-one 1 detail topup = 1 transactions
Ref: topup_details.payment_method_id > payment_method.id // one-to-one 1 metode pembayaran dapat digunakan untuk banyak detail top-up yang berbeda
Ref: transfer_details.transaction_id - transactions.id // one-to-on
