## [VIDEO](https://www.youtube.com/watch?v=jM36M39MA3I)

[APPLY CLUSTER AUTOSCALER](https://www.youtube.com/watch?v=KEC77hXdLDs)

## METRICS API

- Metrics api apke control plane m hoti hai , aur ye apke cluster k metrics ko observe krti hai ki nodes par kitna resource utilization hua hai , us node k resource m se pod n kitna resource utilize kra hai 
- `kubectl top nodes` , ya fir `kubectl top pods` krne k liye hume metrics api dalni hoti hai , 

![image](https://github.com/user-attachments/assets/f3659031-42a9-4a05-9e48-964edd051bc5)

- To resolve this , install metrics api in your cluster

[LINK](https://github.com/kubernetes-sigs/metrics-server)
```
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

![image](https://github.com/user-attachments/assets/7e57f450-1c44-429e-8131-030d2a6a7eb6)


## CA

jab bhi aap node group bnate ho to autoscaling group to bnta hi bnta hai , tabhi to hum minm aur maxm number of nodes jab set krte hain to vo agar koi node khrab ho gyi to usse replace kr deta hai .


if you create more pods replicas without CA , and your nodes gets filled , then your pods will not start and they will get this error
![image](https://github.com/user-attachments/assets/da2d38a1-1529-420b-a7cb-2b5936347a61)

CREATE POLICY

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "autoscaling:DescribeAutoScalingGroups",
        "autoscaling:DescribeAutoScalingInstances",
        "autoscaling:DescribeLaunchConfigurations",
        "autoscaling:DescribeScalingActivities",
        "ec2:DescribeImages",
        "ec2:DescribeInstanceTypes",
        "ec2:DescribeLaunchTemplateVersions",
        "ec2:GetInstanceTypesFromInstanceRequirements",
        "eks:DescribeNodegroup"
      ],
      "Resource": ["*"]
    },
    {
      "Effect": "Allow",
      "Action": [
        "autoscaling:SetDesiredCapacity",
        "autoscaling:TerminateInstanceInAutoScalingGroup"
      ],
      "Resource": ["*"]
    }
  ]
}
```

- Name this policy something like `AmazonEKSClusterAutoscalerPolicy`

- Now create an oidc connect for attaching iam role
  ```
  eksctl utils associate-iam-oidc-provider \
  --cluster demo-cluster \
  --region us-west-1 \
  --approve
  ```

- Now create an service account
  ```
  eksctl create iamserviceaccount \
  --name=cluster-autoscaler \
  --namespace=kube-system \
  --cluster=demo1-cluster \
  --region us-west-1 \
  --attach-policy-arn arn:aws:iam::<your_acc_number>:policy/AmazonEKSClusterAutoscalerPolicy \
  --override-existing-serviceaccounts \
  --approve
  ```

- Apply Cluster Autoscaler 

  ```
  kubectl apply -f https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/cloudprovider/aws/examples/cluster-autoscaler-autodiscover.yaml
  ```

- You can also add these two lines , [LINK](https://www.kubecost.com/kubernetes-autoscaling/kubernetes-cluster-autoscaler/)
  ```
  - --balance-similar-node-groups
  - --skip-nodes-with-system-pods=false
  ```

  - BEFORE AUTOSCALER

     ![Screenshot 2024-10-29 110024](https://github.com/user-attachments/assets/7130394a-4c17-4cf6-893c-a756343fb11c)

  - AFTER AUTOSCALER
     ![Screenshot 2024-10-29 110032](https://github.com/user-attachments/assets/74b2535d-3b12-44d5-bd24-491642699d83)


