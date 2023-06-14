# To run Docker
`docker build -t postgres-with-data ./`

`docker run -d --name nativeats-db -p 5432:5432 postgres-with-data`

Get container id from line above

`docker start container_id`
