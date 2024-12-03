 Ingress Controller is responsible for managing the traffic routing based on the rules defined in the Ingress resource. It helps distribute incoming external traffic to the appropriate backend services running in the cluster, according to the rules specified in the Ingress resource.

Ingress controller is basically a pod .
 Different types of ingress controller
 - NGINX Ingress Controller
 - Traefik Ingress Controller
 - HAProxy Ingress Controller
 - AWS ALB Ingress Controller

There could be many other , every cloud can make their own ingress controller. 

![image](https://github.com/user-attachments/assets/3c4ef2e4-e306-49cd-86d6-331f23d93c5a)

- [TO install](https://github.com/marcel-dempers/docker-development-youtube-series/tree/master/kubernetes/ingress/controller/nginx)     , [Video](https://www.youtube.com/watchv=72zYxSxifpM&t=422s)
  ```
  helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
  helm search repo ingress-nginx --versions
  ```

  From the app version we select the version that matches the compatibility matrix.
  ```
  NAME                            CHART VERSION   APP VERSION     DESCRIPTION
  ingress-nginx/ingress-nginx     4.4.0           1.5.1           Ingress controller for Kubernetes using NGINX a...
  ```

  Now we can use helm to install the chart directly if we want.
  Or we can use helm to grab the manifest and explore its content.
  We can also add that manifest to our git repo if we are using a GitOps workflow to deploy it.

  ```
  CHART_VERSION="4.4.0"
  APP_VERSION="1.5.1"

  mkdir ./kubernetes/ingress/controller/nginx/manifests/

  helm template ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --version ${CHART_VERSION} \
  --namespace ingress-nginx \
  > ./kubernetes/ingress/controller/nginx/manifests/nginx-ingress.${APP_VERSION}.yaml
  ```

- **ERROR**

  I was getting `imagepullbackoff` error on creating ingress controller pods , basically it was not able to fetch the image , I was working on gcp .

  [HOW TO RESOLVE IT](https://stackoverflow.com/questions/65182580/kubernetes-ingress-controller-error-imagepullbackoff)


```
  gcloud compute routers create nat-router \
    --network my-vpc \
    --region us-east4

gcloud compute routers nats create nat-config \
    --router-region us-east4 \
    --router nat-router \
    --nat-all-subnet-ip-ranges \
    --auto-allocate-nat-external-ips
```
- Give your `vpc` name and `region` name in which your private cluster pods are running

- So basically what was happening is in private cluster , instances don't have internet access , so to give them internet access we have to create NAT gateway , this command is doing exactly that , it is creating `Nat gateway` in GCP and that's how private cluster was able to pull the image from k8 registry and create nginx controller pod.

- These two `gcloud` commands are used to create and configure a **Cloud NAT (Network Address Translation)** for a Google Cloud VPC:

1. The first command creates a **Cloud Router** named `nat-router` in the specified **VPC network** (`my-vpc`) within the **us-east4 region**. The Cloud Router is responsible for dynamic route advertisement and IP address management.
   
2. The second command creates a **NAT configuration** named `nat-config` for the `nat-router`, allowing all **subnet IP ranges** within the VPC to access the internet via NAT. It automatically allocates external IP addresses for NAT, enabling instances in the private subnets to communicate with the internet without exposing their private IPs.

### In summary:
These commands effectively set up a **NAT gateway**, allowing instances in private subnets to access the internet securely while keeping their private IP addresses hidden.


**THIS IS NOT A GOOD PRACTICE**

- Companies don't allow internet access to their cluster , so what we do , we pull the required images from the k8 registry if required and then push them into ec2 or any other private registry that we have





