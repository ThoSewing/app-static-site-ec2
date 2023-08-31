<<<<<<< HEAD
variable "instance_ami" {
  description = "AMI ID"
  default     = "ami-051f7e7f6c2f40dc1"
  type        = string
}

variable "instance_type" {
  description = "Instance Size"
  default     = "t2.micro"
  type        = string
}

variable "instance_user_data" {
  description = "User Data"
  default     = <<EOF
#!/bin/bash
echo "{Status: OK}"
EOF
  type        = string
}

variable "instance_key_name" {
  description = "Key Name"
  default     = ""
  type        = string
}

variable "subnet_pub_id" {
  description = "Public Subnet ID"
  default     = ""
  type        = string
}

variable "vpc_security_group_ids" {
  description = "Security Group ID"
  default     = ""
  type        = string
}
=======
# NETWORK VARS DEFAULT VALUES (INPUT IS REQUIRED BECAUSE NO DEFAULT IS DEFINED)

variable "vpc_id" {}
variable "vpc_cidr" {}
variable "vpc_sn_pub_az1_id" {}
variable "vpc_sg_pub_id" {}


# COMPUTE VARS DEFAULT VALUES

variable "ec2_lt_name" {
    type    = string
    default = "ec2_lt_name"
}

variable "ec2_lt_ami" {
    type    = string
    default = "ami-02e136e904f3da870"
}

variable "ec2_lt_instance_type" {
    type    = string
    default = "t2.micro"
}
>>>>>>> b07495bdd64f5b8dc372f7ad6fdada84d61b4195
