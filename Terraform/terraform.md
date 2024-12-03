Q. What happens when you run `terraform init`

- When you run terraform init, initializing the backend refers to setting up and configuring the remote location where Terraform will store its state file. The state file is a critical component in Terraform, as it keeps track of the resources that Terraform manages.
- it initalized the `.tfstate` file if present in some remote storage
- if the modules are referenced using the `source` and source if refrencing some module on github , then on terraform init it fetches all the module refrenced in `source` in `.terraform` directory
- installs the provider plugin , used for cloud provider
- creates a `.terraform,lock.hcl` file


  ![Screenshot 2024-09-12 225726](https://github.com/user-attachments/assets/259d6196-79ca-41a1-b457-79c58df3a515)


![Screenshot 2024-09-12 230323](https://github.com/user-attachments/assets/e1b8231d-993e-4165-ba89-6cbac20cb23a)

Q. what happens when you run `terraform fmt`

- terraform fmt only formats the terraform it does not correct any syntax error
- in the pic i deleted `s` from tags and `terraform fmt` was not able to correct it 

![Screenshot 2024-09-12 230614](https://github.com/user-attachments/assets/b0423515-fa4b-4784-a7ad-f44187bd872f)

Q. what happens when you do `terraform plan`

-  Terraform temporarily creates a state file (often referred to as the "refresh" state) to compare the desired infrastructure (from your configuration files) with the actual infrastructure in your environment.
- This temporary file helps Terraform understand the differences between the current and desired infrastructure states.
- The temporary plan file is used in memory during the plan execution and is not saved to disk by defaul


![Screenshot 2024-09-12 230828](https://github.com/user-attachments/assets/ae9aa3cb-9935-4bc1-b6bc-c67704507340)

Q. What happens when you do terraform apply 

- it create `terraform.tfstate` this file holds all the information related to infrastrucute which is configured in `.tf` files

Q. What if you change something in `tfstate` file lets say you change the name of vpc in `tfstate` file , then what ??

- it will compore the configuration prensent in `tf` file and `.tfstate` since the configuration you changed only in `.tfstate` so after applying it will destroy the current `.tfstate` and pull the configuration present in `tf` files and apply those configuration only , so terraform only applies the configuration present in `tf` files
- 

- ![Screenshot 2024-09-12 231817](https://github.com/user-attachments/assets/e01260ae-0170-46b1-8302-fdf4192da109)

Q. what is `terraform.tfstate.backup` ?

- Terraform creates this backup whenever it makes changes to the state file during an operation, such as terraform apply, to safeguard against data loss or corruption.
- If needed, you can manually restore the backup by renaming terraform.tfstate.backup to terraform.tfstate.

Q. how to call output block in terraform module

![image](https://github.com/user-attachments/assets/2a3a79b0-61db-480f-9374-58879cb0c73e)

Q.  Terraform workspace 


Q. How and why do we use local variable ?


![image](https://github.com/user-attachments/assets/ab0d1fe0-6d16-4feb-b4f3-3f311c265892)


Q. how to call values from tfstate in s3 

```
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "sprint5"
    key    = "PROD/network.tfstate"
    region = "us-east-1"
  }
}

data "aws_security_group" "existing_sg" {
  id = "sg-0e148fb065dae2ce7"
}

module "openvpn" {
  source  = "github.com/mygurkulam-p9/Terrform_Module.git//security-group?ref=main"
  vpc_id  = data.terraform_remote_state.network.outputs.test_vpc_id

```

- you have already implemented vpc module in which `outputs.tf` , `vpc_id` was defined
- Now you are creating lets say a ec2 instance in which you want to refer to that `vpc_id` to do that , you have to refer to the already created `vpc_id` from terraform remote state .


### **Q. tflint ?**

### **Q. Difference between import and data block**

### Q. Difference between count and for_each ??

**`for_each`**

- for_each accepts only `map of string` of `set of string` , so you provide values like this

```
for_each = toset(["instance1", "instance2", "instance3"])
```

OR

```
  for_each = {
    instance1 = "instance1"
    instance2 = "instance2"
    instance3 = "instance3"
  }

```

```
resource "aws_instance" "name" {
  for_each = {
    instance1 = "instance1"
    instance2 = "instance2"
    instance3 = "instance3"
  }
  
  ami           = "ami-0da424eb883458071"
  instance_type = "t2.micro"
  
  tags = {
    Name = each.value
  }
}

```

- If you will pass `[ ] ` list of string then `for_each` will throw an error

**`count`**

- While creating resource we can do lets say `count = 3` , this will create 3 resource of the same type , or we can do `count = length(var.some_variable)` , so whatever will be the number of values we will pass in `some_variable` only those many instances will get created . 

```
resource "aws_instance" "my_instance" {
  count = length(var.ami)
  ami = var.ami[count.index]
  instance_type = "t2.micro"

  tags = {
    Name = "my-instance"
  }

}
```
- We can also use element in count .

```
 ami  = element(var.ami, count.index)
```

How does element work and why in  modern terraform we dont use it that much ?

![image](https://github.com/user-attachments/assets/10ab1dcc-6e21-4c34-9bde-493149f1fccf)

- Basically earlier version m terraform k `count.index` se ache se indexing support nahi thi , meaning ki manlo 2 values di hain list of string m ,  aur number of count 3 hai , to kuki 2 hi value di gyi hain error aa jata tha , isliye log element use krte the , but ab esa jarurat nahi hai , count.index se bhi badhiya kaam hota hai aur count.index bhi ab loop back kr leta hai aur error nahi aata

- Variable

```
variable "ami" {
  type = list(string)
  default = ["ami-0da424eb883458071" , "ami-0da424eb883458071"]
}
```

 - So what is the difference between `for_each` and `count` and when to use which



### **Q. How can you prevent sensitive data from being displayed in the console output when using the output block in Terraform?**

[LINK](https://stackoverflow.com/questions/67650019/need-to-display-sensitive-data-output-variables-in-terraform)

```
output "signalrserviceconnstring" {
  value = azurerm_signalr_service.mysignalrservice.primary_connection_string
  description = "signalR service's primary connection string"
  sensitive = true
}
```


### **Q. Terraform lifecycle**

- Prevent Resource Destruction (prevent_destroy)
    Use this when you want to ensure that a critical resource (like a database or a production server) is never accidentally destroyed.

```
resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = "t2.micro"

  lifecycle {
    prevent_destroy = true
  }
}
```

- Create Before Destroy (create_before_destroy)
    Use this to ensure that Terraform creates a new resource before destroying the old one. This is helpful when you need to replace a resource but avoid downtime or loss of service.

```
resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
}
```

![image](https://github.com/user-attachments/assets/9088eb45-f286-4c88-ac8b-c55dd9ec3edf)


- Ignore Changes to Specific Attributes (ignore_changes)
    Use this when you expect an attribute to be modified outside of Terraform (e.g., manually or by another process) and don't want Terraform to overwrite it.

```
resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = "t2.micro"

  lifecycle {
    ignore_changes = [tags]
  }
}
```



