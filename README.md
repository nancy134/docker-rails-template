# README

These files along with the followin instructions allow you to create a skeleton Rails Postgres project using Docker.

## Modify Service Name

Change 'my-service' to desired service name in the following files
```
Dockerfile
entrypoint.sh
docker-compose.yml
```

## Create Rails skeleton
```
sudo docker-compose run web rails new . --force --no-deps --database=postgresql
```
## Change ownership and build image
```
sudo chown -R $USER:$USER .
docker-compose build
```
## Configure database
Replace config/database.yml will the following and replace text between <> with your parameters
```
default: &default
  adapter: postgresql
  encoding: unicode
  host: <your host> 
  username: <your user name>
  password: <your password> 
  pool: 5

development:
  <<: *default
  database: <your development database name> 


test:
  <<: *default
  database: <your test database name> 
```
## Boot the app
```
docker-compose up
```
### Create the database
In another window, run the following
```
docker-compose run web rake db:create
```
### Test your rails app
```
http://localhost:300
```
