CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  profile_photo TEXT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  username VARCHAR(50),
  email VARCHAR(50),
  password_hash TEXT,
  latitude TEXT,
  longitue TEXT,
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY INT,
  profile_photo TEXT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  username VARCHAR(50),
  email VARCHAR(50),
  password_hash TEXT,
  latitude TEXT,
  longitue TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
);

CREATE TABLE restaurants (
  id SERIAL PRIMARY KEY INT,
  name VARCHAR(50),
  description VARCHAR(50),
  photos TEXT,
  rating DECIMAL,
  price VARCHAR(10),
  popularity VARCHAR(10),
  address VARCHAR(80),
  city VARCHAR(30),
  state VARCHAR(30),
  country VARCHAR(40),
  latitude TEXT,
  longitue TEXT,
);

CREATE TABLE restaurant_reviews (
  id SERIAL PRIMARY KEY INT,
  restaurant_id INT REFERENCES restaurants(id),
  user_id INT REFERENCES users(id),
  rating TEXT,
  comment TEXT,
  photos TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
);

CREATE TABLE restaurant_bookmarks (
  id SERIAL PRIMARY KEY INT,
  restaurant_id INT REFERENCES restaurants(id),
  user_id INT REFERENCES users(id),
  created_at TIMESTAMP,
);


