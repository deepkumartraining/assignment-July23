variable "aws_region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_count" {
  description = "Number of subnets to create"
  default     = 2
}

variable "availability_zones" {
  description = "Availability zones"
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "ssh_cidr_block" {
  description = "CIDR block for SSH access"
  default     = "192.168.0.0/24"
}

variable "web_ami_id" {
  description = "AMI ID for web instances"
  default     = "ami-xxxxxxxx"
}

variable "app_ami_id" {
  description = "AMI ID for app instances"
  default     = "ami-0f11bdca99c4ccd38"
}

variable "instance_type" {
  description = "Instance type for web and app instances"
  default     = "t2.micro"
}

variable "asg_min_size" {
  description = "Minimum size for auto scaling group"
  default     = 2
}

variable "asg_max_size" {
  description = "Maximum size for auto scaling group"
  default     = 4
}

variable "asg_desired_capacity" {
  description = "Desired capacity for auto scaling group"
  default     = 2
}
