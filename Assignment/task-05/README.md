[# KCVPC Project - Virtual Private Cloud Setup in AWS EU-West-1 (Ireland) Region
 
## Introduction
This guide details the process of designing and setting up a Virtual Private Cloud (VPC) with both public and private subnets in AWS EU-West-1 (Ireland) region. The setup includes routing, security groups, and network access control lists (NACLs) to ensure proper communication and security within the VPC.
 
## Architecture Diagram
![VPC Architecture Diagram](https://github.com/bankole874/KodeCamp-04repo/blob/main/Assignment/task-05/images/vpc-subnets-routeTables-networkConnections.png)
 
## Components Explanation
 
- **VPC (Virtual Private Cloud)**: A logically isolated section of the AWS cloud where you can launch AWS resources in a virtual network.
- **Subnets**:
  - **Public Subnet**: A subnet that has a route to an internet gateway, making its resources accessible from the internet.
  - **Private Subnet**: A subnet that does not have a direct route to the internet.
- **Internet Gateway (IGW)**: A horizontally scaled, redundant, and highly available VPC component that allows communication between instances in KCVPC and the internet.
- **NAT Gateway**: Allows instances in a private subnet to connect to the internet or other AWS services, but prevents the internet from initiating a connection with those instances.
- **Route Tables**:
  - **Public Route Table**: Directs internet traffic to the IGW.
  - **Private Route Table**: Routes internet traffic to the NAT Gateway.
- **Security Groups**: Virtual firewalls that control inbound and outbound traffic for your instances.
- **Network ACLs (NACLs)**: Provide an additional layer of security for your VPC by controlling traffic to and from one or more subnets.
 
## Step-by-Step Guide
 
### VPC Creation
 
1. Open the AWS Management Console and navigate to the VPC Dashboard.
2. Click on "Create VPC".
3. Configure the VPC with the following details:
   - **Name**: KCVPC
   - **IPv4 CIDR block**: 10.0.0.0/16
 
![Create VPC](https://github.com/bankole874/KodeCamp-04repo/blob/main/Assignment/task-05/images/2-VPCcreation.png)
 
### Subnets Creation
 
1. Create the Public and Private Subnets:
   - **Name**: PublicSubnet
   - **IPv4 CIDR block**: 10.0.1.0/24
   - **Availability Zone**: Select any one (e.g., eu-west-1a)
   - **Name**: PrivateSubnet
   - **IPv4 CIDR block**: 10.0.2.0/24
   - **Availability Zone**: Select the same as the Public Subnet (e.g., eu-west-1a)

![Create Public Subnet](https://github.com/bankole874/KodeCamp-04repo/blob/main/Assignment/task-05/images/3-PublicAndPrivateSubnets.png)
 
 
### Internet Gateway Configuration
 
1. Create and Attach Internet Gateway:
   - **Name**: IGW
 
![Create IGW](https://github.com/bankole874/KodeCamp-04repo/blob/main/Assignment/task-05/images/4-createAndAttachIGW.png)

 
### Route Tables Configuration
 
1. Create the Public Route Table:
   - **Name**: PublicRouteTable
   - **VPC**: KCVPC
 
2. Add a route to the IGW (0.0.0.0/0 -> IGW).
 
3. Associate the PublicSubnet with the PublicRouteTable.
 
4. Create the Private Route Table:
   - **Name**: PrivateRouteTable
   - **VPC**: KCVPC
 
![Create Private Route Table](https://github.com/bankole874/KodeCamp-04repo/blob/main/Assignment/task-05/images/5-RouteTables.png)
 
5. Ensure no direct route to the internet in the PrivateRouteTable.
 
![No Direct Route](./images/no_direct_route.png)
 
### NAT Gateway Configuration
 
1. Create a NAT Gateway in the PublicSubnet.
2. Allocate an Elastic IP for the NAT Gateway.
 
![Create NAT Gateway](./images/create_nat_gateway.png)
 
3. Update the PrivateRouteTable to route internet traffic (0.0.0.0/0) to the NAT Gateway.
 
![Update Private Route Table](./images/update_private_route_table.png)
 
### Security Groups Setup
 
1. Create a Security Group for public instances (e.g., web servers):
   - **Name**: PublicSG
   - **Inbound Rules**:
     - HTTP (port 80) from 0.0.0.0/0
     - HTTPS (port 443) from 0.0.0.0/0
     - SSH (port 22) from your specific IP
   - **Outbound Rules**: Allow all outbound traffic
 
![Public Security Group](./images/public_security_group.png)
 
2. Create a Security Group for private instances (e.g., database servers):
   - **Name**: PrivateSG
   - **Inbound Rules**: Allow traffic from the PublicSubnet on required ports (e.g., MySQL port 3306)
   - **Outbound Rules**: Allow all outbound traffic
 
![Private Security Group](./images/private_security_group.png)
 
### Network ACLs Configuration
 
1. Configure NACL for the Public Subnet:
   - Allow inbound HTTP, HTTPS, and SSH traffic.
   - Allow all outbound traffic.
 
![Public Subnet NACL](./images/public_subnet_nacl.png)
 
2. Configure NACL for the Private Subnet:
   - Allow inbound traffic from the Public Subnet.
   - Allow outbound traffic to the Public Subnet and the internet.
 
![Private Subnet NACL](./images/private_subnet_nacl.png)
 
### Instances Deployment
 
1. Launch an EC2 instance in the PublicSubnet:
   - **Security Group**: PublicSG
   - Verify internet access.
 
![Public EC2 Instance](./images/public_ec2_instance.png)
 
2. Launch an EC2 instance in the PrivateSubnet:
   - **Security Group**: PrivateSG
   - Verify internet access through the NAT Gateway.
   - Ensure communication with the public instance.
 
![Private EC2 Instance](./images/private_ec2_instance.png)
 
## Conclusion
This guide has provided a comprehensive walkthrough to set up a secure and functional VPC in AWS with both public and private subnets, proper routing, and security configurations. By following these steps, you have created a robust network architecture suitable for various applications.
](https://github.com/bankole874/KodeCamp-04repo/blob/main/Assignment/task-05/images/7-updatedPrivateRouteTables.png)
