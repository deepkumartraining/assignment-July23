## assignment-July23

Route 53 configure - need based
Simple Routing Policy
Weighted Routing Policy
Latency Routing Policy
Failover Routing Policy
Geo Location Routing Policy
Multi Value Routing Policy


Monolithic Example - 3 Tier
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
Bastian host can introduce for any admin activities

EBS can placed for block storage, backup and archival process can be setup based on busines requirement

DB end:
Cache DB can introduce in front of RDS to provide faster response by cache
-- Memcache
-- Redis

If Website/application is read centric then we can introduce read replicas and configure read operation with the help of DB proxies.
Also in place of Multi AZ, read replica can setup in different AZ and in case of failure of primary DB, read replica would be promoted to primary DB.

-- In case of static content serving by website, static content can deploy as website in bucket and accessble application globally with integration of Cloudfront distribution and route 53


Static Hosting (S3 Buckets) -> Cloudfront Distribution (CDN) -> Edge Networks -> Route53 -> User can access globally

Monitoring can include:

if wants aws centric then it can achive with CloudWatch
Need based configuration to messaging system and communication - SQS & SNS

In case third party vendors need to configure - For example - Splunk
Logsync can establish with AWS Appsync and destination would be Splunk
On top of that need based monitoring/dashboarding can configure accordingly


Disadvantages of Monolithic Pattern
Tightly Coupled
Any change has cascading impact
Deployment frequency would be slow
Portability is a challenge
Scalability
Realibility
Future readiness/Technological advancement

Benefits:
Easier deployments
Simplified testing because of end to end integration available at one place
Debugging would be faster

Open Question:
Why we need to put web layer in public subnet, it can be in private subnet as well and accessible via NAT Gateway
Browse this point for details


## Microservice Pattern


CICD Model
