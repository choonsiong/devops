A prometheus server with two monitoring nodes.

```
$
$ docker ps
CONTAINER ID   IMAGE                     COMMAND                  CREATED             STATUS              PORTS                    NAMES
437e19b3530a   ubuntu-node-exporter      "/app/node_exporter-…"   13 seconds ago      Up 12 seconds       0.0.0.0:9100->9100/tcp   prometheus-client-1
dd87d5a0adcb   ubuntu-node-exporter      "/app/node_exporter-…"   13 minutes ago      Up 13 minutes       0.0.0.0:9101->9100/tcp   prometheus-client-2
9d865ac0f1b4   prom/prometheus:v2.55.1   "/bin/prometheus --c…"   About an hour ago   Up About a minute   0.0.0.0:9090->9090/tcp   prometheus-v2
$
```

To run the prometheus server (version 2) container (make sure prometheus.yml exists inside `config` directory):

`docker container run -d -p 9090:9090 -v "$HOME/prometheus/config:/etc/prometheus" --name prometheus-v2 prom/prometheus:v2.55.1`

![img](image.png)