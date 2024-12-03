to create a eks , a policy is attached to cluster

```
AmazonEKSClusterPolicy
```

![image](https://github.com/user-attachments/assets/6fb390c6-32fa-46f1-8024-5259460dcdc7)


To create a node group in it , we attach again 3 different policy to ec2

```
AmazonEC2ContainerRegistryReadOnly
AmazonEKS_CNI_Policy
AmazonEKSWorkerNodePolicy
```

![image](https://github.com/user-attachments/assets/a51c10c6-db8c-4e04-a02f-2c19f51f3829)
