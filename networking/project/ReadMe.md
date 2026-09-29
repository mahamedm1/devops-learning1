# Networking Project - EC2, NGINX, DNS & HTTPS

## Project Overview

In this project, I deployed an NGINX web server on an Ubuntu AWS EC2 instance and made it publicly accessible through my own custom domain.

I configured Cloudflare DNS with an A record to map my domain name to the public IPv4 address of my EC2 instance. I also configured the EC2 security group to allow SSH, HTTP and HTTPS traffic and secured the website using TLS with Certbot and Let's Encrypt.

The purpose of this project was to put my networking knowledge into practice and understand how DNS, IP addresses, ports, security groups, EC2, NGINX, HTTP and HTTPS work together when a user accesses a website.


## Architecture

The project follows this flow:

                    User
                      |
                      | https://mmahamud.com
                      v
               Cloudflare DNS
                      |
                      | A Record
                      v
               EC2 Public IPv4
                      |
                      v
              Security Group
                /         \
          HTTP :80      HTTPS :443
              |             |
              |             v
              |           NGINX
              |             |
              |             v
              +------> Web Page

When a user enters my domain name, DNS resolves the domain to the public IPv4 address of my EC2 instance.

The browser then connects to the EC2 instance. The AWS Security Group controls which ports are accessible. HTTP traffic on port 80 is redirected to HTTPS, while HTTPS traffic uses port 443.

NGINX listens for web requests and serves the webpage back to the user's browser.

## EC2 Setup

I created an AWS EC2 instance running Ubuntu Server to host the NGINX web server.

An EC2 instance is a virtual machine running on AWS infrastructure. The instance was assigned a public IPv4 address, allowing it to be reached over the internet.

I created a key pair during the instance setup so that I could securely connect to the server using SSH.

### EC2 Instance
![EC2 Instance](screenshots/EC2-instance.png)


## Security Group Configuration

I configured the EC2 Security Group to control which inbound traffic was allowed to reach my server.

The following inbound rules were configured:

- **SSH (Port 22)** — Restricted to my public IP for secure administrative access to the EC2 instance.
- **HTTP (Port 80)** — Allowed from `0.0.0.0/0` so that users can access the website over HTTP.
- **HTTPS (Port 443)** — Allowed from `0.0.0.0/0` so that users can securely access the website over HTTPS.

Port 22 was restricted because SSH provides administrative access to the server, whereas ports 80 and 443 need to be publicly accessible for web traffic.

This helped me understand how security groups act as virtual firewalls for EC2 instances by controlling which traffic is allowed to reach the server.

### Security Group Inbound Rules

![Security Group](screenshots/security-groups.png)


## Connecting to EC2 Using SSH

After launching the EC2 instance, I connected to the Ubuntu server remotely using SSH.

I first restricted the permissions of my private key:

```bash
chmod 400 networking-module.pem
```
I then connected to the EC2 instance using:
```
ssh -i networking-module.pem ubuntu@ec2-xx-xx-xx-xx.eu-west-1.compute.amazonaws.com
```
-> **Security Note:** I have intentionally not included my `.pem` private key in this repository because it contains sensitive authentication credentials.

## Installing NGINX

After connecting to the EC2 instance through SSH, I updated Ubuntu's package list:

```bash
sudo apt update
```
I then installed NGINX:

```bash
sudo apt install nginx -y
```

NGINX is the web server used in this project. It listens for incoming web requests and sends the requested web content back to the user's browser.
I verified that NGINX was running using:

```
systemctl status nginx
```

### Testing NGINX
Before configuring my domain, I tested the web server directly using the EC2 instance's public IPv4 address. The default **Welcome to nginx!** page loaded successfully.
This confirmed that:
- The EC2 instance was reachable over the internet.
- NGINX was running successfully.
- Port 80 was accessible.
- The security group was allowing HTTP traffic to reach the server.

![NGINX Welcome page](screenshots/nginx-homepage.png)


## DNS Configuration

After confirming that the NGINX web server was accessible through the EC2 public IP address, I configured my custom domain using Cloudflare DNS.

I created an **A record** with the following configuration:

- **Type:** A
- **Name:** `@`
- **IPv4 address:** EC2 public IPv4 address
- **Proxy status:** DNS only
- **TTL:** Auto

An A record maps a domain name to an IPv4 address. In my case, `mmahamud.com` points to the public IPv4 address of my EC2 instance.

This allows users to access the web server using:

```text
mmahamud.com
```

instead of having to remember the EC2 public IP address.

### Cloudflare DNS Record

![Cloudflare DNS Record](screenshots/cloudflare-dns.png)
