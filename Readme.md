

Start a container
```
docker run  \
  -dP \
  -e TITLE="ebedszunet lalyosnak" \
  -e COLOR=cyan \
  -e BODY='<iframe src="https://giphy.com/embed/2L4rIUxrB6YUI35VYr" width="480" height="480" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/cat-coffee-bring-get-me-2L4rIUxrB6YUI35VYr">via GIPHY</a></p>' \
  web:v6
```

## Volumes

```
docker run -d \
  --name mydb \
  -e POSTGRES_PASSWORD=secret  \
  postgres
```


```
docker exec -it mydb psql -U postgres -c 'select * from vip'
```


init

```
docker run -d \
  --name mydb \
  -e POSTGRES_PASSWORD=secret  \
  -v vipdb:/var/lib/postgresql/data \
  -v $PWD/sql:/docker-entrypoint-initdb.d \
  postgres
```

cleanup:
```
docker rm -f mydb
docker volume rm vipdb
```

## Networks

```
docker network create lufi
```

create dinner
```
docker run -dP \
  --net lufi  \
  --name vacsora  \
  -v  $PWD/dinner.html:/var/www/html/index.html  \
    web:v6 \
      nginx -g "daemon off;"
```

```
docker run -it --rm \
  --net lufi \
  busybox
```

## dev/qa/prod envs

```
docker compose up -d
docker compose --env-file  .env.qa up -d
docker compose --env-file  .env.prod up -d
```