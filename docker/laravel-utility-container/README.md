### Running `artisan migrate`

```
$ docker compose run --rm artisan migrate
WARN[0000] /Users/choonsiong/Developer/devops/docker/laravel-utility-container/docker-compose.yml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion 
[+] Building 1.2s (11/11) FINISHED                                                                                                                                                                                            docker:desktop-linux
 => [artisan internal] load build definition from php.dockerfile                                                                                                                                                                              0.0s
 => => transferring dockerfile: 374B                                                                                                                                                                                                          0.0s
 => [artisan internal] load metadata for docker.io/library/php:8.2.4-fpm-alpine                                                                                                                                                               0.9s
 => [artisan internal] load .dockerignore                                                                                                                                                                                                     0.0s
 => => transferring context: 2B                                                                                                                                                                                                               0.0s
 => [artisan 1/5] FROM docker.io/library/php:8.2.4-fpm-alpine@sha256:f20c9409b660e20b0a3a13c61448d51e4b4bb1055a4dca897d9490aa8e3e087d                                                                                                         0.0s
 => [artisan internal] load build context                                                                                                                                                                                                     0.3s
 => => transferring context: 862.88kB                                                                                                                                                                                                         0.3s
 => CACHED [artisan 2/5] WORKDIR /var/www/html                                                                                                                                                                                                0.0s
 => CACHED [artisan 3/5] COPY src .                                                                                                                                                                                                           0.0s
 => CACHED [artisan 4/5] RUN docker-php-ext-install pdo pdo_mysql                                                                                                                                                                             0.0s
 => CACHED [artisan 5/5] RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel                                                                                                                                  0.0s
 => [artisan] exporting to image                                                                                                                                                                                                              0.0s
 => => exporting layers                                                                                                                                                                                                                       0.0s
 => => writing image sha256:57254a73d1855a7324f41eb53d64e294323d6e8156eedf615bc86836af9f6654                                                                                                                                                  0.0s
 => => naming to docker.io/library/laravel-utility-container-artisan                                                                                                                                                                          0.0s
 => [artisan] resolving provenance for metadata file                                                                                                                                                                                          0.0s

   INFO  Preparing database.  

  Creating migration table ............................................................................................................. 9.36ms DONE

   INFO  Running migrations.  

  0001_01_01_000000_create_users_table ................................................................................................ 24.70ms DONE
  0001_01_01_000001_create_cache_table ................................................................................................. 8.25ms DONE
  0001_01_01_000002_create_jobs_table ................................................................................................. 20.25ms DONE

$
```

### Running `docker compose`

```
$ docker compose up --build server       
WARN[0000] /Users/choonsiong/Developer/devops/docker/laravel-utility-container/docker-compose.yml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion 
[+] Running 0/0
[+] Running 0/1 Building                                                                                                                                                                                                                      0.1s 
[+] Building 1.2s (11/11) FINISHED                                                                                                                                                                                            docker:desktop-linux 
 => [php internal] load build definition from php.dockerfile                                                                                                                                                                                  0.0s
 => => transferring dockerfile: 374B                                                                                                                                                                                                          0.0s
 => [php internal] load metadata for docker.io/library/php:8.2.4-fpm-alpine                                                                                                                                                                   0.9s 
 => [php internal] load .dockerignore                                                                                                                                                                                                         0.0s
 => => transferring context: 2B                                                                                                                                                                                                               0.0s
 => [php 1/5] FROM docker.io/library/php:8.2.4-fpm-alpine@sha256:f20c9409b660e20b0a3a13c61448d51e4b4bb1055a4dca897d9490aa8e3e087d                                                                                                             0.0s
 => [php internal] load build context                                                                                                                                                                                                         0.3s
 => => transferring context: 862.88kB                                                                                                                                                                                                         0.2s 
 => CACHED [php 2/5] WORKDIR /var/www/html                                                                                                                                                                                                    0.0s
 => CACHED [php 3/5] COPY src .                                                                                                                                                                                                               0.0s
 => CACHED [php 4/5] RUN docker-php-ext-install pdo pdo_mysql                                                                                                                                                                                 0.0s
 => CACHED [php 5/5] RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel                                                                                                                                      0.0s
 => [php] exporting to image                                                                                                                                                                                                                  0.0s
 => => exporting layers                                                                                                                                                                                                                       0.0s
 => => writing image sha256:dcca420e0dcf2c9bbfd7ec4f44a9ec01ea48f29330c63d09c6d4238e6e3cf8ad                                                                                                                                                  0.0s
[+] Running 4/1o docker.io/library/laravel-utility-container-php                                                                                                                                                                              0.0s
 ✔ Service php                                   Built                                                                                                                                                                                        1.3s 
 ✔ Container laravel-utility-container-mysql-1   Created                                                                                                                                                                                      0.0s 
 ✔ Container laravel-utility-container-php-1     Created                                                                                                                                                                                      0.1s 
 ✔ Container laravel-utility-container-server-1  Created                                                                                                                                                                                      0.0s 
Attaching to server-1
server-1  | /docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
server-1  | /docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
server-1  | /docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
server-1  | 10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
server-1  | 10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
server-1  | /docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
server-1  | /docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
server-1  | /docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
server-1  | /docker-entrypoint.sh: Configuration complete; ready for start up
server-1  | 2025/01/22 06:55:49 [notice] 1#1: using the "epoll" event method
server-1  | 2025/01/22 06:55:49 [notice] 1#1: nginx/1.26.2
server-1  | 2025/01/22 06:55:49 [notice] 1#1: built by gcc 13.2.1 20240309 (Alpine 13.2.1_git20240309) 
server-1  | 2025/01/22 06:55:49 [notice] 1#1: OS: Linux 6.10.14-linuxkit
server-1  | 2025/01/22 06:55:49 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
server-1  | 2025/01/22 06:55:49 [notice] 1#1: start worker processes
server-1  | 2025/01/22 06:55:49 [notice] 1#1: start worker process 29
server-1  | 2025/01/22 06:55:49 [notice] 1#1: start worker process 30
server-1  | 2025/01/22 06:55:49 [notice] 1#1: start worker process 31
server-1  | 2025/01/22 06:55:49 [notice] 1#1: start worker process 32
server-1  | 2025/01/22 06:55:49 [notice] 1#1: start worker process 33
server-1  | 2025/01/22 06:55:49 [notice] 1#1: start worker process 34
server-1  | 2025/01/22 06:55:49 [notice] 1#1: start worker process 35
server-1  | 2025/01/22 06:55:49 [notice] 1#1: start worker process 36
server-1  | 2025/01/22 06:55:49 [notice] 1#1: start worker process 37
server-1  | 2025/01/22 06:55:49 [notice] 1#1: start worker process 38
server-1  | 172.24.0.1 - - [22/Jan/2025:06:57:13 +0000] "GET / HTTP/1.1" 200 39314 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:134.0) Gecko/20100101 Firefox/134.0" "-"
```