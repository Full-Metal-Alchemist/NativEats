# NativEats
## Getting Started
```
npm install
npm run dev -w api
npm run ios -w app
```

## Adding new packages
Install a React Native package

`npm install PACKAGE_NAME -w app`

Install a package for Express / API server

`npm install PACKAGE_NAME -w api`

Installing a package used in both React Native and the API server

`npm install PACKAGE_NAME

## API Endpoints
```
POST /api/v1/auth/login
POST /api/v1/auth/logout

POST /api/v1/bookmarks
DELETE /api/v1/bookmarks

GET /api/v1/cuisines
POST /api/v1/cuisines
GET /api/v1/cuisines/:cuisineId
PUT /api/v1/cuisines/:cuisineId
DELETE /api/v1/cuisines/:cuisineId

GET /api/v1/recipes
POST /api/v1/recipes
GET /api/v1/recipes/:recipeId
PUT /api/v1/recipes/:recipeId
DELETE /api/v1/recipes/:recipeId

GET /api/v1/restaurants
POST /api/v1/restaurants
GET /api/v1/restaurants/:restaurantId
PUT /api/v1/restaurants/:restaurantId
DELETE /api/v1/restaurants/:restaurantId

GET /api/v1/reviews
POST /api/v1/reviews
GET /api/v1/reviews/:reviewId
PUT /api/v1/reviews:reviewId
DELETE /api/v1/reviews/:reviewId

POST /api/v1/users
GET /api/v1/users/:userId
PUT /api/v1/users/:userId
DELETE /api/v1/users/:userId
```
