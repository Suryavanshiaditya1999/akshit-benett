# EFK

## [VIDEO](https://www.youtube.com/watch?v=HGTBANm0VY4&list=PLdpzxOOAlwvJUIfwmmVDoPYqXXUNbdBmb&index=5)

[EFK BLOG BY Opstree](https://opstree.com/blog/2023/01/24/protected-efk-stack-setup-for-kubernetes/)

![image](https://github.com/user-attachments/assets/cff2e899-931b-41c5-b211-85c5c07dec78)

- OIDC Connector

```
eksctl utils associate-iam-oidc-provider \
--cluster demo-cluster \
--region us-west-1 \
--approve
```

- Service Account 

```
eksctl create iamserviceaccount \
    --name ebs-csi-controller-sa \
    --namespace kube-system \
    --cluster demo1-cluster \
    --role-name AmazonEKS_EBS_CSI_DriverRole \
    --role-only \
    --attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
    --approve
```

- Retrieve IAM Role ARN

```
ARN=$(aws iam get-role --role-name AmazonEKS_EBS_CSI_DriverRole --query 'Role.Arn' --output text)
```

- Deploy EBS CSI Driver
```
eksctl create addon --cluster demo1-cluster --name aws-ebs-csi-driver --region us-west-1 --version latest --service-account-role-arn $ARN --force
```


- 

```
helm repo add elastic https://helm.elastic.co
helm repo update
```

```
helm search repo elastic
```

- From here we can install any chart that we want for elasticsearch .. using commands like

[ELASTIC SEARCH INSTALL](https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-stack-helm-chart.html)

```
helm install es-kb-quickstart elastic/eck-stack
```

```
helm install elasticsearch elastic/elasticsearch
```

![image](https://github.com/user-attachments/assets/22194577-3410-4c8d-9846-07aab6440f08)


- now that you have enable `EBS CSI DRIVER` for your eks cluster

- Create a namespace
  
```
kubectl create namespace logging
```

```
helm install elasticsearch \
 --set replicas=1 \
 --set volumeClaimTemplate.storageClassName=gp2 \
 --set persistence.labels.enabled=true elastic/elasticsearch -n logging
```

- Elastic search ka username aur password janne k liye taki vo hum fluentbit ko de payein , since fluentbit needs elasticsearch username and password to communicate with elasticsearch

```
# for username
kubectl get secrets --namespace=logging elasticsearch-master-credentials -ojsonpath='{.data.username}' | base64 -d
# for password
kubectl get secrets --namespace=logging elasticsearch-master-credentials -ojsonpath='{.data.password}' | base64 -d
```


- When runnig Fluentbit , it usually fetches the logs of application from this location , Because the containers that are running generate logs at this very location only

  ```
  /var/log/containers
  ```

- Install Kibana

```
helm install kibana --set service.type=LoadBalancer elastic/kibana -n logging
```

- Install Fluentbit with Custom Values/Configurations


- `cd day-5` , keep in mind there is lua script in `fluentbit-values.yaml` which basically not allow logs to be fetched from `logging` namespace . we can customize fluentbit according to our own from configuration . 

```
helm repo add fluent https://fluent.github.io/helm-charts
helm install fluent-bit fluent/fluent-bit -f fluentbit-values.yaml -n logging
```
  - Do change the elasticsearch password in output section , whatever is your password for elasticsearch

- lets deploy two services to see their logs on kibana

```
git clone https://github.com/iam-veeramalla/observability-zero-to-hero.git
cd observability-zero-to-hero.git/day-4
kubectl apply -k kubernetes-manifest/
```



