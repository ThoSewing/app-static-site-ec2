variable "network_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Network CIDR Block"
}

variable "network_enable_dns_hostnames" {
  type        = bool
  default     = true
  description = "Enable DNS Hostnames"
}

variable "subnet_pub_cidr_block" {
  type        = string
  default     = "10.0.1.0/24"
  description = "Public Subnet CIDR Block"
}

variable "subnet_map_public_ip_on_launch" {
  type        = bool
  default     = true
  description = "Public Subnet Map Public IP on Launch"
}

variable "subnet_pub_availability_zone" {
  type        = string
  default     = "us-east-1a"
  description = "Public Subnet Availability Zone"
}

variable "sg_public_name" {
  type        = string
  default     = "sg_public"
  description = "Public Security Group Name"
}

# NETWORK VARS DEFAULT VALUES

variable "vpc_cidr" {
    type    = string
    default = "10.0.0.0/16"
}

variable "vpc_az1" {
    type    = string
    default = "us-east-1a"
}

variable "vpc_cidr_all" {
    type    = string
    default = "0.0.0.0/0"
}

variable "vpc_dns_hostnames" {
    type    = bool
    default = true
}

variable "vpc_sn_pub_az1_cidr" {
    type    = string
    default = "10.0.1.0/24"
}

variable "vpc_sn_pub_map_public_ip_on_launch" {
    type    = bool
    default = true
}


# SECURITY GROUP VARS DEFAULT VALUES

variable "vpc_sg_port_all" {
    type    = number
    default = 0
}

variable "vpc_sg_port_ssh" {
    type    = number
    default = 22
}

variable "vpc_sg_port_http" {
    type    = number
    default = 80
}

variable "vpc_sg_protocol_any" {
    type    = string
    default = "-1"
}

variable "vpc_sg_protocol_tcp" {
    type    = string
    default = "tcp"

}