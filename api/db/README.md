# To run Docker
`docker build -t postgres-with-postgis ./`

`docker run -d --name nativeats-db -p 5432:5432 postgres-with-postgis`
