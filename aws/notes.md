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

## Containers

### Docker

- Docker packages apps with relevant dependencies and libraries, so they can be run on any OS
- Containers are lightwieght as they dont have their own OS so they are much faster to start
- Docker image is a blueprint for your app containing everything to run
- Images are stored in docker repos like amazon ecr or docker hub
- docker containers share kernel
- docker daemon manages containers
- containers better are faster and lghtweigt since dont need own os, less cpu and memory
- portable- can run on any os supporting docker


### Virtual Machine
- VM's are virtual systems mimicking hardware
- Each vm runs its own OS 
- Hypervisor software manahging multiple vm;s on the local machine and gets resources on the host machine
- Runs its own OS, large and slow. Resource usage is higher

## Serverless
- Developers dont have to manage servers 
- They deploy code and functions
- You can focus on building your application without worrying about the infrastructure

#### Lambda
- Virtual functions so no server to manage, runs only on demand not continuously
- Easy Pricing and scaling is automated, no need to be configured
- Integrated with many programming languages
- Easy monitoring through AWS Cloudwatch


## AWS Networking

### CIDR - Classless Inter-Domain Routing
- A method used to allocate IP addresses
- Contains a base IP and a subnet mask 

### VPC - Virtual Private Cloud
- Isolated network in the cloud within AWS where you deploy your EC2 instane for example
- 5 VPCs per AWS Region by default (can be increased).
- VPCs and other networks that need to communicate should have non-overlapping IP ranges to prevent routing conflicts.


### VPC Peering
- Allows two VPC's to communicate privately with eachother usnig their private ip addersses
- Occurs if you have resources in two separate VPC's that need to communicate with eachother




### Internet Gateway
- Allows resources connected to your vpc access the internet
- You create it manually when you create your vpc, dodesn't happen by default
- One IG can be connected to one VPC
- IG's alone can't give acces to interenet, subnets must be routed using route tables 

### Bastion Hosts
- An EC2 instance in a public subnet that acts as an entry point to private EC2 instances
- Allows admins to access private instances without exposing them to the internet
- It works by SSH'ing to the bastion host and then SSH to your private instance
- Security group from bastian host must allow inbound from internet
- Securtiy group of EC2 instance must allow inbound SSH from the bastion host 

### NAT Gateway - Network Access Translation
- Allows EC2 instances in private subnets to access internet by ,mapping their private IP to a public one without allowing inbound internet traffic
- Typically deployed in a public subnet with an elastic IP and route to Internet Gateway
- Proivate subnet route tables send internet bound traffic to the NAT gateway 
- No security groups used 

### NACL - Network Access Control List
- Like a firewall controlling traffic to and from subnets
- One NACL per subnet
- Runs on a determined set of rules you define
- Unlike security groups, you have to define inbound and outbound traffic
- The rule with the lower number will have precedence. E.g. rule 1 will be listened to first
- Last rule ends with an * and denies a request in case of no rule match 
- They're good if you want to block specific IP address at subnet level

### Egress-Only Internet Gateway
- Allows instances in your VPC outbound connections over IPv6 while preventing internet connections back to the instance
- They IPv6 addresses are not translated like the IPv4
- Only can intitiate outbound connections


## DNS ROUTE 53

- AWS mangaed DNS service
- Authoritative so you can update DNS records
- Is a domain registrar
- Can check health of your resources

### Hosted Zones
- Public Hosted Zones: Contain records that specify how to route traffic on the internet
- Private Hosted Zones: Contain records how you route traffic within one or more VPC's

### TTL - Time To lIve
- Determines how long a DNS record can be cached before it needs to be checked again
- Low TTL: DNS changes picked up fast but will require more NDS queries = more money
- High TTL: Reduces DNS queries but changes will take longer to reach users

### CNAME 
- DNS record that maps one domain name to another domain name 
- Cant be used for root domains like example.com as other DNS records are used such as NS records they cant co-exist with CNAME

### ALIAS
- Allows your domain to point to supported AWS resources or another Route 53 record.
- Can be used at the root domain

### Routing Policies
- Simple: Route traffic to a single resource
- Weighted: Control the percentage of requests that go to each specific resource
- Latency: Redirect to the reasource that has the least latency close to us
- Geolocation: Allows you to direct traffic based on the users physical location
- Geoproximity: Allows you to adjust how muhc tarffic goes to a resource based on bias value 
- IP-Based Routing: Routing based on clients IP addresses
- Multi-Value Routing: Used when routing traffic to multiple resources

Domain Registars allow you to purchase domains and register them.
DNS services hosts and manages DNS records, allowing domain names to resolve to the correct destinations
