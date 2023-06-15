# To run Docker

Need docker installed on machine

Can install through brew or download docker desktop app

Install docker through brew
```
brew install colima
colima start
brew install docker
```

Check to see if postgres is running in brew

`brew services`

If postgres is running above, stop it

`brew services stop @postgres_version`

cd into api/db to build the Dockerfile

`docker build -t postgres-with-data ./`

Run the Dockerfile from api/db

`docker run -d --name nativeats-db -p 5432:5432 postgres-with-data`

Get container id from line above to start container

`docker start container_id`

## The following commands should only be run when the seed changes

Get docker container id

`docker ps`

Stop docker container instance

`docker stop container_id`

Remove docker container

`docker rm container_id`

Remove docker image

`docker rmi image_name`
