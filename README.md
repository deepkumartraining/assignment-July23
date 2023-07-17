## assignment-July23

Route 53 configure - need based
Simple Routing Policy
Weighted Routing Policy
Latency Routing Policy
Failover Routing Policy
Geo Location Routing Policy
Multi Value Routing Policy


3 Tier Architecture for web applications
Web/UI layer
Public subnet
Security Group - Web Layer
Multi AZ setup for HA
Autoscaling
Application Load Balancer
open port - 443 only
Integration open via Security Group from App Layer only
Web Layer <- App Layer


App Layer 
Private subnet
Security Group - App Layer
Multi AZ setup for HA
Autoscaling
Internal Load Balancer
Integration open via Security Group from DB Layer only
App Layer <- DB Layer

DB Layer
Private Subnet
DB subnet group
Multi AZ setup for HA
Asynchronous replication
In case of disaster switch to second AZ

Security Aspects
Some other improvement can include
API gateway can introduce in from of Web Layer to provide better security in terms of
-- Traffic filtering
-- Rate limiting
-- Route redirection

--Image hardening can introduce

Proper IAM based setup - User/Group/Role based authentication

NAT instance can setup for internet access on private subnet based instances

EBS can placed for block storage, backup and archival process can be setup based on busines requirement
EFS can be introduced in place of EBS for persistent storage
DB end:
Cache DB can introduce in front of RDS to provide faster response by cache
-- Redis

If Website/application is read centric then we can introduce read replicas and configure read operation with the help of DB proxies.
Also in place of Multi AZ, read replica can setup in different AZ and in case of failure of primary DB, read replica would be promoted to primary DB.

-- In case of static content serving by website, static content can deploy as website in bucket and accessble application globally with integration of Cloudfront distribution and route 53


Static Hosting (S3 Buckets) -> Cloudfront Distribution (CDN) -> Edge Networks -> Route53 -> User can access globally

Dynamo DB can introduce in case of large set of non relational data, best fit solution for AWS managed no sql db with multiple read replica and HA options

Monitoring can include:

if wants aws centric then it can achive with CloudWatch
Need based configuration to messaging system and communication - SQS & SNS

In case third party vendors need to configure - For example - Splunk
Logsync can establish with AWS Appsync and destination would be Splunk
On top of that need based monitoring/dashboarding can configure accordingly


# ------------ Documentation
The infrastructure architecture described in the Terraform code consists of the following components:

Virtual Private Cloud (VPC): The VPC is the foundation of the infrastructure and provides isolated network space for resources. It is created with the specified CIDR block (e.g., 10.0.0.0/16).

Subnets: The infrastructure includes both public and private subnets. Public subnets are associated with a route table that has a route to the internet gateway, allowing outbound and inbound internet traffic. Private subnets are associated with a route table that routes outbound traffic through a NAT gateway and inbound traffic through the public subnet NAT gateway.

Internet Gateway (IGW): The IGW enables communication between the VPC and the internet. It is attached to the VPC, allowing resources in the public subnet to have direct access to the internet.

NAT Gateway: The NAT gateway is deployed in the public subnet to provide internet access to resources in the private subnet. It is associated with an Elastic IP address.

Route Tables: There are separate route tables for the public and private subnets. The public subnet route table routes traffic to the internet gateway, while the private subnet route table routes outbound traffic to the NAT gateway.

Security Groups: The infrastructure includes security groups for the web, app, and DB tiers. These security groups define inbound and outbound rules to control traffic flow. For example, the web security group allows HTTP and SSH traffic from specific sources, the app security group allows HTTP traffic from the web security group, and the DB security group allows MySQL traffic from the app security group.

Auto Scaling Groups (ASGs): ASGs are used to automatically manage the number of instances in the web and app tiers. They ensure that the desired number of instances is maintained, allowing for scalability and high availability.

RDS Database Instance: The infrastructure includes an RDS database instance running MySQL. It is deployed in the private subnet and is accessible only from the app tier through the security group rules.


# -----------------



Open Question:
Why we need to put web layer in public subnet, it can be in private subnet as well and accessible via NAT Gateway
Browse this point for details


## Microservice Pattern


CICD Model
