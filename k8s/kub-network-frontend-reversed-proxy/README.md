```
$ ls
auth-deployment.yaml      auth-service.yaml         frontend-deployment.yaml  frontend-service.yaml     task-deployment.yaml      task-service.yaml         users-deployment.yaml     users-service.yaml
$
$ kubectl get services
NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   3d23h
$
$ kubectl get deployments
No resources found in default namespace.
$
$ kubectl get pods       
No resources found in default namespace.
$
$ kubectl apply -f auth-service.yaml 
service/auth-service created
$
$ kubectl apply -f auth-deployment.yaml 
deployment.apps/auth-deployment created
$
$ kubectl apply -f users-service.yaml  
service/users-service created
$ kubectl apply -f users-deployment.yaml 
deployment.apps/users-deployment created
$
$ kubectl apply -f task-service.yaml    
service/tasks-service created
$
$ kubectl apply -f task-deployment.yaml 
deployment.apps/tasks-deployment created
$
$ kubectl apply -f frontend-service.yaml 
service/frontend-service created
$
$ kubectl apply -f frontend-deployment.yaml 
deployment.apps/frontend-deployment created
$
$ kubectl get pods
NAME                                 READY   STATUS    RESTARTS   AGE
auth-deployment-bf8548d64-gf4tk      1/1     Running   0          42s
frontend-deployment-d5f498c4-lstcv   1/1     Running   0          5s
tasks-deployment-767d9d4dc7-29dw5    1/1     Running   0          15s
users-deployment-56d5994cbc-whdg4    1/1     Running   0          28s
$ kubectl get deployments
NAME                  READY   UP-TO-DATE   AVAILABLE   AGE
auth-deployment       1/1     1            1           46s
frontend-deployment   1/1     1            1           9s
tasks-deployment      1/1     1            1           19s
users-deployment      1/1     1            1           32s
$
$ kubectl get services   
NAME               TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
auth-service       ClusterIP      10.96.66.68      <none>        80/TCP           54s
frontend-service   LoadBalancer   10.100.89.227    localhost     80:30363/TCP     17s
kubernetes         ClusterIP      10.96.0.1        <none>        443/TCP          3d23h
tasks-service      LoadBalancer   10.111.115.103   localhost     8000:30381/TCP   27s
users-service      LoadBalancer   10.99.225.254    localhost     8080:31412/TCP   41s
$
```