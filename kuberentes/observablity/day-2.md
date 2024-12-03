[VIDEO](https://www.youtube.com/watch?v=OfoQMJJSnUs&list=PLdpzxOOAlwvJUIfwmmVDoPYqXXUNbdBmb&index=6)


[REPO LINK](https://github.com/iam-veeramalla/observability-zero-to-hero/tree/main)

- Add prometheus repo using helm in kubernetes

```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

- Create a namespace

```
kubectl create ns monitoring
```

- Clone the Abhishek's repo

```
git clone https://github.com/iam-veeramalla/observability-zero-to-hero.git
```

```
cd observability-zero-to-hero/day-2

helm install monitoring prometheus-community/kube-prometheus-stack \
-n monitoring \
-f ./custom_kube_prometheus_stack.yml
```

- To see all the resource in namespace monitoring

```
kubectl get all -n monitoring
```

![image](https://github.com/user-attachments/assets/5a6ba046-f883-49a8-995c-075aaaa4d8f9)

- So the three things which are manily used and managed with prometheus are `Node exporter` `kube-state-metrics` and `/metrics`

- Node Exporter : For nodes related info.

- Kube-state-metric : for kubernetes related information

- /metrics : application endpoint , for scraping application metrics . 



- As you can see node exporter is installed as a daemon set , it pulls cpu info , memory info etc from all nodes  , it will communicate with the system and read the system metrics file . 

- Prometheus will pull these metrics

- `kube-state-metrics` : It will get all the info from kubernets API server , like pod status , the deployment status , how many times pod crashed  etc . Everything that we can collect from API server , this kube-state-metric will fetch/scrape all these metrics from Kubernetes cluster . 

![image](https://github.com/user-attachments/assets/4982c831-12fa-4caa-8a12-76f0616ab2b4)

