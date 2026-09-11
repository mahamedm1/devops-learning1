## Networking Fundamentals

### Computer Networks - A group of devices connected to each other allowing them to share information and resources

#### LAN - Local Are Network:
- Connects devices within a small area i.e home, office
- Allows them to communicate and share resources like printers and shared files
- Used to provide internet access in a small area


#### WAN - Wide Area Network:
- Connects devices in a larger area i.e internet
- Connects multiple LANs, enable data transfer over long distances

Networks are the foundation that enables communication between devices. They also allow us to share resources, I.e accessing shared fles at work.

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


- Allows devices to locate and communicate with eachother.

#### IPv4
- 192 .168.0.5 32 bit address

#### IPv6 

- 128-bit address Hexadecimal format 2001: 0db8: 85a3: 0000: 0000: 8a2e: 0370: 7334

Without IP addresses devices wouldn't know where to receive or send data

### Mac Address

- Unique identifier assigned to a network interface
- Each device on a network has its own unique mac address
- 48-bit address: 00: 1A: 2B: 3C: 4D: 5E hexadecimal format
- Operates at the data link layer in OSI
- Helps device identification within a local network and help with network communication and security

Data is transferred in packets. A packet contains source and destination ip so the network knows where the packet is coming from and where it is ending up. The packet is then placed in a frame containing a mac address and hops to the next device. The frame is removed and the packets destination ip is examined decides the next hop and uses the next hop's mac address to deliver it until the packet reaches it's destination.

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
- 

