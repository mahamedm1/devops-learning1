## Networking Fundamentals

### Computer Networks - A group of devices connected to each other allowing them to share information and resources

#### LAN - Local Area Network:
- Connects devices within a small area i.e. home, office
- Allows them to communicate and share resources like printers and shared files
- Used to provide internet access in a small area


#### WAN - Wide Area Network:
- Connects LAN's across large geographical areas i.e. internet
- Connects multiple LANs, enable data transfer over long distances

Networks are the foundation that enables communication between devices. They also allow us to share resources, i.e. accessing shared files at work.

When you use an application, your device sends data to a server over the network. The server processes this data and sends it back


### Switches
Connects multiple devices within the same network, ensuring smoot data flow between devices
- Manages data flow withing LAN

### Router

- Directs traffic between different networks.  
- Connects different networks. 	I.e. home network to the internet 

### Firewall

- Monitors and controls incoming and outgoing network traffic based on predetermined security rules
- Protects networks from unauthorised access 


### IP Address - Internet Protocol Address

- Unique identifier assigned to a network interface, used to identify where to send IP traffic on a network


- Allows devices to locate and communicate with each other.

#### IPv4
- 192 .168.0.5 32 bit address

#### IPv6 

- 128-bit address Hexadecimal format 2001: 0db8: 85a3: 0000: 0000: 8a2e: 0370: 7334

Without IP addresses devices wouldn't know where to receive or send data

### Mac Address

- A device can have multiple network interfaces, and each interface can have its own MAC address.
- Each device on a network has its own unique mac address
- 48-bit address: 00: 1A: 2B: 3C: 4D: 5E hexadecimal format
- Operates at the data link layer in OSI
- Helps device identification within a local network and help with network communication and security

Data is transferred in packets. A packet contains source and destination IP so the network knows where the packet is coming from and where it is ending up. The packet is then placed in a frame containing source and destination mac address and hops to the next device. The frame is removed and the packets destination ip is examined decides the next hop and uses the next hop's mac address to deliver it until the packet reaches it's destination.

### Ports

- Ports are logical communication endpoints that help direct network traffic to the right application or service. 
- IP address ensures data is delivered to the right device, but that device can be running many thing
- Ports are there to ensure the OS knows which service to direct the data to

          Computer
        192.168.1.10
             🏢
      ┌──────┼──────┐
      🚪     🚪     🚪
     :22    :80    :443
     SSH    HTTP   HTTPS


### Protocols

- Protocols are a set of rules for how devices should communicate with each other
- They are important as they ensure both sides of the networks understand and communicate with each other correctlty

#### TCP - Transmission Control Protocol

- Ensures data sent from one device to another is transferred accurately and in the correct order
- It is connection oriented so both devices must be connected before transfer
- Requires a handshake so they agree to communicate
- TCP checks for errors
- Bi-directional communication
- Reliable data transfer - good for emails, web browsing etc

#### UDP - User Datagram Protocol

- Connectionless - no connection between sender and receiver
- Quick and easy to use
- Prior communication not required
- Fast because no connection set up and no error checking making it less reliable, used for streaming, online gaming
- Anything DNS related

## OSI - Open Systems Interconnection
- This is a 7 layer model used to understand how data travels from one device/application to another across a network

### Layer 7 - Application Layer
- This is where network services are given directly to applications. i.e. HTTP, SSH, DNS

### Layer 6 - Presentation Layer
- This is where data is translated to a readable format and where encryption is also handled. i.e. SSH IMAP

### Layer 5 - Session Layer
- This is the layer that can manage many sessions. i.e. sockets

### Layer 4 - Transport Layer
- End to end communication is data integrity is handled. i.e. TCP UDP

### Layer 3 - Network Layer
- Where routing and forwarding of data packets is managed. i.e. IP ICMP

### Layer 2 - Data Link
- Node to node transfer and error detection is managed. i.e. ethernet, switches

### Layer 1 - Physical Layer
- The physical connection between devices. i.e. fibre, wireless, hubs

## DNS - Domain Name System
- DNS translates a domain name, like google.com, to an IP address. Sometimes that name can point to multiple IP addresses.

### Name Server
- Server that stores DNS records for a domain and answers queries for that domain

#### Recursive Name Server
- Recursive name server. This takes a client's DNS query, checks its cache, and if needed, walks the hierarchy root to TLD to authoritative, returns the answer, and caches it.

#### Authoritative Name Server
- Holds the authoritative DNS records for a zone and provides final DNS answers like A records with IP addresses

#### Zone Files
- Zone files. A text file containing the DNS records for a zone served by authoritative servers.

#### Records
- DNS records are the actual data entries that describe domain information.
- A records map hostnames to IPv4 addresses
- AAAA records map hostnames to IPv6 addresses
- CNAME is an alias to another name
- MX specifies what mail servers are responsible for receiving mail for the domain 
- NS is authoritative name servers for the zone
- TXT holds text data for things like verification and security


### DNS Resolution – Finding a Domain's IP Address
- When you enter a domain name such as bbc.com, your computer needs to find the IP address associated with that domain.
- Your computer first checks whether it already has the DNS answer cached.
- If it doesn't, it sends a DNS query to a recursive DNS resolver.
- The resolver checks its own cache first.
- If the answer isn't cached, the resolver works through the DNS hierarchy:
  1. Root name server → tells the resolver which TLD name servers handle .com.
  2. TLD name server (.com) → tells the resolver which authoritative name servers handle bbc.com.
  3. Authoritative name server → provides the requested DNS record, such as an A record containing an IPv4 address.
- The resolver sends the answer back to your computer and usually caches it for future queries.
- Your computer now has an IP address it can use to begin connecting to the website.
In simple terms:
Computer → DNS Resolver → Root → .com TLD → Authoritative Name Server → IP address → Resolver → Computer


### Domain Registrar
- Allows you to register and manage a domain name.
- Keeps track of who has registered the domain.
- Allows you to specify which name servers the domain should use.
  
### DNS Hosting Provider
- Hosts and manages the DNS records for your domain.
- Provides authoritative name servers that answer DNS queries for the domain.
- Stores records such as A, AAAA, CNAME, MX and TXT.

## Routing
- Routing is how data finds it's way across networks. Ensuring data reaches it's destination efficiently.
- Routers determine the best path using round tables to make decisions
- This enhances network optimisation as your packets take efficient pathways, reducing latency -> faster

### Static Routing
- Routes manually set by network admins. Reliable but if the route changes you must update manually

### Dynamic Routing
- Uses algorithms to automatically find the best path for data. Data moves efficiently even if network conditions change

Routing protocols use algorithms automate the process of determining the best route for data to travel across a network

OSPF - Open Shortest Path First
- Finds shortest path for data to travel
- Can quickly recalculate routes
  

BGP - Border Gateway Protocol
- Uses path vector mechanism


## Subnetting
= Dividing one large networks into smaller ones 

### CIDR Networks - Classless Inter-Domain Routing
- A method for allocating IP address and routing IP packets

### Subnet Masks 
- Tell a device which part of an IP address is the network and which part is the host

## NAT - Network Address Translation
- Translates private address to public address
- NAT Process:
- Internal device uses private address
- Router translates prisate ip to public ip
- Allows devices to communicate with external network

### Static NAT
- Maps single private IP address to single public IP address

### Dynamic NAT 
- Maps private IP address to one of many IP addresses from a pool of public IP address

### PAT - Port Address Translation
- Allows multiple on a local network to a single IP address with different port numbers

NAT is important as:
- It conserves IP address, not many are left
- Enhances network security
- Simplifies network design and management
