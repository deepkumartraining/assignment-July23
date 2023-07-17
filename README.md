# ***********************Assignment-July23*************************

*************************************************************************************
## 1st Challenge Solution

### 3-Tier Web Application Architecture

![Architecture](/Arch/3TierArch_WebApplication_Arch_v0.1.jpg)

--------------------------------------------------------------------------------------
### IAC - Terraform - Navigate to below link for complete codebase

![IAC-Code](/terraform/)

### Reference Pointers

Below mentioned components can be provisioined with :

#### Virtual Private Cloud (VPC): 
The VPC is the foundation of the infrastructure and provides isolated network space for resources. It is created with the specified CIDR block (e.g., 10.0.0.0/16).

![VPC](/Arch/VPCRoutemap.JPG)

#### Subnets: 
The infrastructure includes both public and private subnets. Public subnets are associated with a route table that has a route to the internet gateway, allowing outbound and inbound internet traffic. Private subnets are associated with a route table that routes outbound traffic through a NAT gateway and inbound traffic through the public subnet NAT gateway.

![Subnets](/Arch/Subnet.JPG)

#### Internet Gateway (IGW): 
The IGW enables communication between the VPC and the internet. It is attached to the VPC, allowing resources in the public subnet to have direct access to the internet.

![IGW](/Arch/igw.JPG)

#### NAT Gateway: 
The NAT gateway is deployed in the public subnet to provide internet access to resources in the private subnet. It is associated with an Elastic IP address.

![NAT-Gateway](/Arch/nat.JPG)

#### Route Tables: 
There are separate route tables for the public and private subnets. The public subnet route table routes traffic to the internet gateway, while the private subnet route table routes outbound traffic to the NAT gateway.

![Route-Tables](/Arch/RT.JPG)

#### Security Groups: 
The infrastructure includes security groups for the web, app, and DB tiers. These security groups define inbound and outbound rules to control traffic flow. For example, the web security group allows HTTP and SSH traffic from specific sources, the app security group allows HTTP traffic from the web security group, and the DB security group allows MySQL traffic from the app security group.

![Security Group](/Arch/sg.JPG)

#### Auto Scaling Groups (ASGs): 
ASGs are used to automatically manage the number of instances in the web and app tiers. They ensure that the desired number of instances is maintained, allowing for scalability and high availability.

![web-asg](/Arch/web-asg.JPG)

![app-asg](/Arch/app-asg.JPG)

![app-launch-configuration](/Arch/app-lc.JPG)

![web-launch-configuration](/Arch/web-lc.JPG)

![app-target-group](/Arch/app-tg.JPG)

![web-target-group](/Arch/web-tg.JPG)

### RDS Database Instance: 
The infrastructure includes an RDS database instance running MySQL. It is deployed in the private subnet and is accessible only from the app tier through the security group rules.

![DB-Subnet-Group](/Arch/db_sng.JPG)

![RDS](/Arch/rds.JPG)

### Application Load Balancer and Internel Load Balancer
ALB - Front layer for web-tier
ILB - Internal load balancer in front of App-tier

![ALB](/Arch/alb.JPG)

![ILB](/Arch/ilb.JPG)

### Provisioned Instances

![Instances](/Arch/Instances.JPG)

![AMI](/Arch/AMI.JPG)

******************************************************************************************
### Security - SecOps consideration

#### API gateway can introduce in from of ALB/CDN to provide better security in terms of
    Traffic filtering
    Rate limiting
    Route redirection

#### IAM Consideration - user/group/roles/policies/ACLs

#### NAT Gateway: part of this design & implemenation

#### Bastian Host: Administration activities on web-tier/app-tier

#### Image hardening

#### Data Security:
    Data in motion: HTTPS/TLS
    Data at rest: storage encrypion - AWS managed, customer managed, byok & HSM
    data in use: Application code encryption with data encryption key

*****************************************************************************************
### Performance Specific:

####  Static Hosting: static media hosting can be served via S3 Bucket -> Static Hosting -> CDN -> Route 53 -> End user
(Mentioned in Architecture)

#### DB Performance: 
    Cache DB can introduce in front of RDS for better performance/faster response.
    If application is read centric then read replica can introduce and redirect read traffic on read replicas.
    Multi-AZ - part of setup and used for disaster recovery

#### Block Storage/File Storage:
    EBS can be used for block storage, backup and archival process can be setup with Snapshots -> s3 for disaster recovery.
    EFS can introduce for mount file requirement with persistent data
    AMI can be created for base images/customized image or any kind of on top of requirements

#### Dynamo DB can introduce in case of large set of non relational data, best fit solution for AWS managed no sql db with multiple read replica and HA options.

*****************************************************************************************
### Alerting and Monitoring requirement:

#### AWS Centric:
    Cloud Watch
    Cloud trail
    SNS
    SES

#### Third-Party
For example - Splunk
    Logsync can establish with AWS Appsync, destination would be Splunk and On top of that need based monitoring/dashboarding can configure accordingly.

*************************************************************************************
## 2nd Challenge Solution

### Automation script for gathering metadata of Instance in AWS

Script:

![Script](/scripts/Instancemetadata.py)

*************************************************************************************
## 3rd Challenge Solution

### object/objects finding via key in nested object

Script:

![Script](/scripts/nestedobjectkey.py)

### Execution Snapshots

![Test-Output](/Arch/script_3_test.JPG)

*************************************************************************************












Open Question:
Why we need to put web layer in public subnet, it can be in private subnet as well and accessible via NAT Gateway
Browse this point for details


## Microservice Pattern


CICD Model
