# SERVICE ACCOUNT

files present in `/var/run/secrets/kubernetes.io/serviceaccount`

![image](https://github.com/user-attachments/assets/bdf9ddbf-7bf5-46c8-b6d4-1f902b9534f9)

so as you can see we have three things here 

- ca.crt
- namespace
- token

to check the service account that is mounted on our pod 

![image](https://github.com/user-attachments/assets/bca5d013-25d2-490e-a2d3-f1de3d007e20)

## **`ca.crt`**

Ye certificate kubernetes api k sath secure connection establish krne m madad krta hai .

Across the cluster `ca.crt` ka jo public key hai vo same hi hai , yaani api server k pass bhi same public key hai , ab isse hoga ky 

Api server k pass ek `public key` hai aur ek `private key` , api server n `private key` k madad se ek `certificate` sign kr k dia fir use pod ko dia , pod k pass same `public key` hai isse usne uss message ko decrypt kr lia .
Ye kese kaam kr rha hai usko samjhne k liye iss [link](https://github.com/himanshumudgal08/bennet-linux/blob/main/kuberentes/public&privateKEY.md) par click kro





# Creating an Amazon EKS Service Account for AWS Secrets Manager Access

To create an Amazon EKS service account that can access secrets from AWS Secrets Manager, follow these steps:

## Step 1: Create an IAM Policy

First, create an IAM policy that allows access to Secrets Manager. You can use the following JSON policy as a template:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "secretsmanager:GetSecretValue",
                "secretsmanager:DescribeSecret"
            ],
            "Resource": "*"
        }
    ]
}
```

## Step 1: Create an IAM Policy

1. Go to the IAM console in the AWS Management Console.
2. Click on "Policies" and then "Create policy."
3. Choose the "JSON" tab and paste the policy above.
4. Review and create the policy, giving it a name (e.g., `SecretsManagerAccessPolicy`).

## Step 2: Create an IAM Role for the Service Account

Next, create an IAM role that the service account will use.

1. Go to the IAM console.
2. Click on "Roles" and then "Create role."
3. Choose "EKS" as the trusted entity and select "EKS - Cluster."
4. Attach the policy you created earlier (`SecretsManagerAccessPolicy`).
5. Give the role a name (e.g., `EKSSecretsManagerRole`) and create it.

## Step 3: Create the EKS Service Account

Now, create a Kubernetes service account that uses the IAM role. You can use the following YAML manifest:

```
apiVersion: v1
kind: ServiceAccount
metadata:
  name: secrets-manager-sa
  namespace: default  # Change if you want to use a different namespace
  annotations:
    eks.amazonaws.com/role-arn: arn:aws:iam::<YOUR_AWS_ACCOUNT_ID>:role/EKSSecretsManagerRole
```

Replace `<YOUR_AWS_ACCOUNT_ID>` with your actual AWS account ID.

1. Save the above YAML to a file named `service-account.yaml`.
2. Apply the manifest using kubectl:

   ```bash
   kubectl apply -f service-account.yaml
   ```


## Step 4: Use the Service Account in Your Pods

Finally, specify the service account in your pod or deployment YAML:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: your-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: your-app
  template:
    metadata:
      labels:
        app: your-app
    spec:
      serviceAccountName: secrets-manager-sa
      containers:
        - name: your-container
          image: your-image

```

## Summary

- Create an IAM policy for Secrets Manager access.
- Create an IAM role and attach the policy.
- Create a Kubernetes service account that uses the IAM role.
- Specify the service account in your pod or deployment.


Q. Ky ho agar m ` automountServiceAccountToken: false` kar dun to ..??

- pehle ye samjho : har namespace m ek default service account hota hai , agar nya namespace bhi bnaye to usme bhi ek service account by default create ho jata hai , agar tumne `automountServiceAccountToken: false` nahi kra hai to , ek service account apne aap mount ho jata hai pod k saath ..

- ![image](https://github.com/user-attachments/assets/b7907258-21bb-4c20-94da-a58b77fe62c2)

-  ![image](https://github.com/user-attachments/assets/a671a31d-21e3-4ada-b60a-695272f6904f)



