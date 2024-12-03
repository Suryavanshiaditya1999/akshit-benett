Q. why don't we use load balancer instead of ingress , i mean eventually ingress also creates load balancer so why don't we directly create it

ans . 
![image](https://github.com/user-attachments/assets/29a816a2-b8c6-4e42-8d31-162780ebad40)

that's because to expose different services we will use type load balancer and for each service a new load balancer will be creates , hence creating more cost . 


**Using `gce` : ingress controller by gcp**

```
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: gke-ingress
  annotations:
    kubernetes.io/ingress.class: "gce"
spec:
  rules:
  - host: indiantech.fun
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: frontend
            port:
              number: 80
      - path: /actuator/health
        pathType: Prefix
        backend:
          service:
            name: salary
            port:
              number: 8080
```
