main.tf
variables.tf
output.tf
local.tf
backend.tf
providers.tf
	provider version
	terraform version
	provider block
		features
		authentication
	Multiple Providers 

types of authentication
	using SP
	using user

modules
	file inside that

State file
	what 
	how
	desired state
	actual state

terraform init
	backend init
	modules init
	providers download
	hcl file
	.terraform
		module
		provider

terraform validate

terraform plan
	state file
terraform apply	

state locking
lease
break lease 
-lock=false

Terraform functions1

Terraform import
terraform state rm <state playground> | upgrade modules
state show | list

Loops
	for each
		dynamic block
	count
	for

state show

Landing Zone architecture

environment segrigation
	same main.tf | multiple tfvars
	different main.tf | dedicated tfvars
	same tfvars but different branch

Passing naming and values via local and env name

branching policy for code moving

pipeline creation

keeping secret

Terraform cost estimation
terraform graph

tfsec

tflint
