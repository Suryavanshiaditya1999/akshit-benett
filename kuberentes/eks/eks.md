# EKS

[VIDEO](https://www.youtube.com/watch?v=RRCrY12VY_s&t=165s)

EKS Can be used with nodes or fargate , in this demo i have used fargate 

### CREATE CLUSTER

```
eksctl create cluster --name demo-cluster --region us-east-1 --fargate
```

- With node group but public
```
eksctl create cluster --name demo1-cluster --region us-west-1 \
--nodegroup-name demo-nodes \
--node-type t2.medium \
--nodes 2 \
--nodes-min 2 \
--nodes-max 6
```

- Private node group cluster

```
eksctl create cluster --name demo1-cluster --region us-west-1 \
--nodegroup-name demo-nodes \
--node-type t2.medium \
--nodes 2 \
--nodes-min 2 \
--nodes-max 6 \
--node-private-networking
```

### DELETE CLUSTER

```
eksctl delete cluster --name demo-cluster --region us-west-1
```


# PRE REQUISTES

kubectl – A command line tool for working with Kubernetes clusters. For more information, see Installing or updating kubectl. [LINK](https://kubernetes.io/docs/tasks/tools/)

eksctl – A command line tool for working with EKS clusters that automates many individual tasks. For more information, see Installing or updating. [LINK](https://eksctl.io/installation/)


AWS CLI – to communicate with aws . [LINK](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

------------------------------------------------------------------------------------------------------------------------------------------------

 - Set up new profile for fargate in which you will be putting your namespace
   
   ```
   eksctl create fargateprofile \
    --cluster demo-cluster \
    --region us-west-1 \
    --name alb-sample-app \
    --namespace game-2048
   ```

- Now set kubeconfig in your machine through which you are want to access your cluster so that you can run kubectl commands on machine .
  ```
  aws eks update-kubeconfig --name demo-cluster --region us-west-1
  ```

- Now deploy your application
  ```
  kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/examples/2048/2048_full.yaml
  ```
  This will deploy service , namespace , deployment and ingress resource

- Now connect with OIDC so that eks can talk with iam and your services can access resources that are outside cluster environment like secret manager , in this  case this oidc is getting used so that we can connect with load balancer
  ```
  eksctl utils associate-iam-oidc-provider \
  --cluster demo-cluster \
  --region us-west-1 \
  --approve
  ```

  ![image](https://github.com/user-attachments/assets/ccca9b68-e2d4-4369-84ee-f164ca035927)

- Now create a iam policy for our service account .

  - Download iam policy
    ```
    curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/install/iam_policy.json
    ```
  - Create IAM Policy
    ```
    aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam_policy.json
    ```

- Create Service account and IAM Role
  ```
  eksctl create iamserviceaccount \
  --cluster=<cluster_name>\
  --namespace=<your_namespace> \
  --name=aws-load-balancer-controller \
  --role-name AmazonEKSLoadBalancerControllerRole \
  --region <your_cluster_region> \
  --attach-policy-arn=arn:aws:iam::<your_acc_id>:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve
  ```


- Deploy ALB Controller now
  -  Add helm repo
     ```
     helm repo add eks https://aws.github.io/eks-charts
     ```

  - update repo if there are any updates in repo
    ```
    helm repo update eks
    ```

  - Deploy alb controller
    ```
    helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
    -n kube-system \
    --set clusterName=demo-cluster \
    --set serviceAccount.create=false \
    --set serviceAccount.name=aws-load-balancer-controller \
    --set region=us-west-1 \
    --set vpcId=vpc-075225bc8f17f029c \
    --set service.beta.kubernetes.io/aws-load-balancer-subnets=subnet-0263e4d5622868e62 \
    --set service.beta.kubernetes.io/aws-load-balancer-subnets=subnet-07401644d279b73a3
    ```
 

    ![image](https://github.com/user-attachments/assets/50420f81-edf9-4518-ab7e-d9330860bf1b)


## ERROR I FACED

I didn't initally provided 2 public ids while creating alb controller , because of that alb was not getting created , since alb need atleast 2 subnets in different availability zone to get provisioned . So i corrected it , in the last command , you can see i have corrected it .
