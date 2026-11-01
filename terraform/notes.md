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
- By default, it is stored in a local backend, in a file called terraform.tfstate
- Alternatively it can be stored in a remote backend such as an AWS S3 Bucket

