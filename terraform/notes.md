# Terraform
Terraform is a infrastructure as a code tool that allows you to create, manage and destroy cloud infra using code instead of manually configuring everything on the AWS console.

## Terraform State Files
- An up to date record of your existing infrastructure ensuring idempotency
- Idempotency means no matter how many times you run your terraform configuration, it would not produce the same result. Even if you make a change to your configuration, only that change will be applied

### Desired vs Current State
- Desired: Is your terraform configuration of things you're trying to implement or deploy. This is what you are trying to achieve.
- Current: Is what actually exists in your infrastructure. It compares your desired state to its current state and makes the necessary changes to reflect it

## Terraform Init
- Terraform init initialises a Terraform working directory
- It configures a backend which decides where the state file will be stored
- Downloads providers which allows communication to AWS when deploying things through terraform
- By default, it is stored in a local backend, in a file called terraform.tfstate
- Alternatively it can be stored in a remote backend such as an AWS S3 Bucket

## Terraform Valid
- Validates the terraform config files to ensure they are syntactically valid

## Terraform Plan
- Used when you make a change to your Terraform configuration
- Terraform plan will show you what will be changed and how terraform will change it
- +: creates a resource
- -: destroys a resource
- ~: updates a resource

## Terraform Apply
- Generates a new plan which is then executed to bring the infrastructure in line with the terraform configuration 
- Terraform updates it's state file afterwards to maintain idempotency
- This is essential as this is what allows Terraform to track and identify the resources it manages

## Terraform Destroy
- Safely and efficiently destroys resources managed by your terraform configuration
- Reads the state file and current configuration
- Generates a destruction plan detailing what to destroy
- Terraform updates the state file

## Terraform Import
- Used if a resource already exists in a cloud environment you never created it with terraform
- Terraform import allows you to bring existing resources under your terraform management without creating anything from scratch
- Once you've run the terraform import command, the current state should match the desired state

## Local State Files
- This when the terraform state file is stored locally by default
- The state file is used by terraform to track the infrastructure it manages and compares it to you configuration (desired state) and your real infrastructure
- Easy to set up and suitable for lone projects
- No backup if your machine loses the files, hard to work collaboratively

## Remote State Files
- This is when your state files are stored in a remote backend such as AWS S3 
- Easy to work collaboratively since remote state locking means nobody can apply changes simultaneously
- It is backed up so is recoverable

