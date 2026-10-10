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

## EC2 - Elastic Compute Cloud

- Essentially renting a virtual machines on AWS - EC2
- It can store data on virtual drives - EBS
- It can distribute data traffic evenly amongst other servers
- Scaling happens automatically. You pay for what you use.

### EC2 Instance Types

- General Purpose: Genereal workloads
- Compute Optimised: If you need lots of processing power. It gives you extra CPU
= Memory Optimised: When your application needs a lot of memory/RAM
- Strorage OPtimised: Designed for fast and high throuput storage that require quick access to storage
- Accelerated Computing: For enhanced performance
- HPC Optimised: Designed for intensive computer task requiring a lot of power

## Security Groups

- They control how traffic is allowed in or out of an EC2 instance
- They only contain allow rules

### Ports

- 22: SSH - Log into linux instance
- 21: FTP - Upload files into a file share
- 22: SFTP - Upload files using SSH
- 80: HTTP - access unsecured websites
- 443 HTTPS - access secured websites
- 53: DNS - for DNS queries and resolving
- 3389: RDP - Log into a windows instance

### Elastic IP

- Public IPv4 address that you can own as long as its not deleted
- Only charged when they are not in use
- Only can attcach to one instance at a time
- They are very useful if you have external services that need to point to your server using a static IP
- As DNS resolvers won't have to keep resolving for new IP's hence users/services won't lose access temporaril

## Storage

### EBS Volume - Elastic Block Store

- An EBS is a network drive you can attach to your instance whilst it's running
- They are like a network USB stick
- They persist even when the instance stops. Basically all the data remains even when instance stops.

### AMI - Amazon Machine Image

- Customisation of an EC2 instance
- You can use an AMI to save time launching an instance with pre-made configurations

### EFS - Elastic File System

- Managed by the network file system that can be mounted on many EC2 instances 
- Shared storage for multiple instances
- Highly available
- Expensive

## Load Balancing & Scalability

- Scalability is when an application can handle greater loads by adapting
- Vertical Scalability: Scaling up by making your server bigger - more cpu or ram
- Horizontal Scalability: Adding more instances to share the load
- Horizontal Scalability is tied into high availability whereas vertical is not 
- High availability is running multiple instances for the same application/service on multiple AZ's

### Load Balancers
- They distribute requests evenly across available instances by forwarding them downstream
- Application Load Balancer - designed for websocket, TCP, SSL, http and https
- Network Load Balancer - designed for high performance and low latency apps


### ALB 
- Operates at layer 7 (HTTP)
- Load balancing to multiple HTTP apps across machines
- Load balancing to mutliple apps on the same machine - containers
- Supports redirects 

### NLB
- Operates layer 4 (TCP, UDP)
- Less latency, used if you need faster response times


### Sticky Sessions
- Sticky sessions ensure a client is redirected to the same intance behind a load balancer
- Useful for session heavy apps
- But can overload an instance if too many users are redirected


### Health Checks
- Load balancers perform health checks so they prevent sending requests to instances that are down
- It sends a request to a certain port and route, /health is common
- If the response is not 200 (OK) then the instance is not healthy

### SSL Certificates - Secure Sockets Layer
- Allows traffic between your clients and your load balancer to be encrypted in transit
- SSL certificates are issued by certificate authorities
- They have an expiration date

#### SNI - Sever Name Indication
- Allows multiple ssl certificates to be loaded on the same web server
- Only works with NLB ALB cloudfront


### Auto Scaling Group
- ASG allows your instance to scale in or out depending on usage
- Automatically registers new instances to a new load balancer
- Minimum capacity - Least number of instacnes u want runnign
- Desired capacatiy - The target number you want ot have running unless osmething chnages 
- Maximum capacity - Most number of instances, dont want more becasue higher cost
- Creates a new instance using the AMI configurations










