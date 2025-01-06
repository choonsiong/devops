#### docker build:

```
$ docker build -t apache-php-helloworld .                                    
[+] Building 1.7s (7/7) FINISHED                                                                                                                                                                                              docker:desktop-linux
 => [internal] load build definition from Dockerfile                                                                                                                                                                                          0.0s
 => => transferring dockerfile: 140B                                                                                                                                                                                                          0.0s
 => [internal] load metadata for docker.io/library/php:8-apache                                                                                                                                                                               1.7s
 => [internal] load .dockerignore                                                                                                                                                                                                             0.0s
 => => transferring context: 2B                                                                                                                                                                                                               0.0s
 => [internal] load build context                                                                                                                                                                                                             0.0s
 => => transferring context: 523B                                                                                                                                                                                                             0.0s
 => CACHED [1/2] FROM docker.io/library/php:8-apache@sha256:b84148f7453d86e5b6a325aaaa70fbf3e8f455eb958bd398346912e5f03c991e                                                                                                                  0.0s
 => [2/2] COPY index.php /var/www/html                                                                                                                                                                                                        0.0s
 => exporting to image                                                                                                                                                                                                                        0.0s
 => => exporting layers                                                                                                                                                                                                                       0.0s
 => => writing image sha256:aa784c27a2bc7b0dff59c5093b70dc548fe2f17113fab4e2ebb6fff04f388d58                                                                                                                                                  0.0s
 => => naming to docker.io/library/apache-php-helloworld                                                                                                                                                                                      0.0s

View build details: docker-desktop://dashboard/build/desktop-linux/desktop-linux/huta4zqxh9b0nbp34gk80pj3t

What's next:
    View a summary of image vulnerabilities and recommendations → docker scout quickview 
```

#### docker run:

```
$ docker run -d --name apache-php-helloworld -p 8080:80 apache-php-helloworld
70966b8732516bcc9bffb4a8bdd1ad3067e71425a3c04eae7c0c1299501a73a2
$
$ docker ps
CONTAINER ID   IMAGE                   COMMAND                  CREATED         STATUS         PORTS                  NAMES
70966b873251   apache-php-helloworld   "docker-php-entrypoi…"   3 minutes ago   Up 3 minutes   0.0.0.0:8080->80/tcp   apache-php-helloworld
$
```

![image](img.png)