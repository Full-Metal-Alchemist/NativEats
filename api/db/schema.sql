CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  username VARCHAR(50),
  profile_photo TEXT,
  password_hash TEXT,
  latitude TEXT,
  longitude TEXT,
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE restaurants (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(50),
  description TEXT,
  photos JSON,
  rating DECIMAL,
  price VARCHAR(10),
  review_count INT,
  popularity INT,
  address VARCHAR(80),
  city VARCHAR(30),
  state VARCHAR(30),
  country VARCHAR(40),
  latitude TEXT,
  longitude TEXT,
  is_visible BOOLEAN DEFAULT true,
  transcation TEXT[],
  hour TEXT[][],
  phone VARCHAR(20),
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE reviews (
  id SERIAL PRIMARY KEY NOT NULL,
  restaurant_id INT REFERENCES restaurants(id),
  user_id INT REFERENCES users(id),
  rating DECIMAL,
  comment TEXT,
  photos TEXT,
  is_visible BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT now(),
  updated_at TIMESTAMP
);

CREATE TABLE bookmarks (
  user_id INT REFERENCES users(id),
  restaurant_id INT REFERENCES restaurants(id),
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE cuisines (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(50),
  about TEXT,
  photo TEXT,
  is_visible BOOLEAN DEFAULT true
);

CREATE TABLE cuisine_restaurant (
  cuisine_id INT REFERENCES cuisines(id),
  restaurant_id INT REFERENCES restaurants(id)
);

CREATE TABLE recipes (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(50),
  steps TEXT,
  photos JSON,
  is_visible BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE cuisine_recipe (
  cuisine_id INT REFERENCES cuisines(id),
  recipe_id INT REFERENCES recipes(id)
);
