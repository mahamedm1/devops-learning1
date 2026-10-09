# AWS

## Availability Zones - AZ's
- One region may have multiple AZ's
- Each AZ's is a separate physical location with one or many data center's.
- The logic behind it is, if one AZ was to fail, resources will still be running through the other. Hence the isolation.


## IAM - Identity Access Manager

### Users & Groups
- Root account - Made by default once you've made an AWS account. This shouldn't be shared or used
- Users - People within your organisation that can be grouped
- Groups - A collection of users
- One user can be in multiple groups or no group at all

### Permissions
- Users & Groups can be assigned JSON docs called policies
- These define permissions of the user
- Good practice is to apply only the relevant permissions to each role.

### Inheritance
- Users can belong to multiple groups and inherit those permissions from those groups
- But as user in a group can have inline policies attached to them only


### IAM Policies

- JSON documents that define permissions.
- Specify which AWS actions are allowed or denied on which resources.
- Can be attached to users, groups or roles.

### IAM Roles

- AWS identities with permissions that can be assumed temporarily.
- Commonly used by EC2 instances and other AWS services.
- Can also be assumed by users or applications.
- Use temporary credentials rather than permanent access keys.

### Security

- MFA (Multi-Factor Authentication)
- Adds an extra layer of security beyond a password.
- Requires an additional authentication factor, such as an authenticator app.

### Password Policy

- Defines password requirements for IAM users.
- Can enforce minimum length, complexity and password expiration.

### AWS CLI

- Command Line Interface used to manage AWS services through terminal commands.
- Useful for scripting and automating AWS tasks.

### AWS SDK

- Software Development Kit used to interact with AWS through programming languages.
- Supports languages such as Python (Boto3), Java and JavaScript.

### Access Keys

- Used for programmatic access to AWS through the CLI or SDK.
- Consist of an Access Key ID and Secret Access Key.
- Avoid long-term access keys where temporary credentials can be used.

### Audit

#### IAM Credential Report

- Account-wide report showing the status of IAM user credentials.
- Includes password status, MFA status, access keys and their usage.
- Helps identify unused credentials and security risks.

#### IAM Access Advisor

- Shows which AWS services a user, group or role has accessed and when.
- Helps identify unused permissions.
- Useful for applying the Principle of Least Privilege.  
