variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Deployment environment (dev, uat, prod)"
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "uat", "prod"], var.environment)
    error_message = "Environment must be one of: dev, uat, prod."
  }
}

variable "project_name" {
  description = "Project name used as prefix for all resources"
  type        = string
  default     = "myapp"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    cidr      = string
    az        = string
    is_public = bool
  }))
  default = {}
}

variable "ec2_instances" {
  description = "Map of EC2 instances to create"
  type = map(object({
    ami_id        = string
    instance_type = string
    subnet_key    = string
  }))
  default = {}
}

variable "bucket_suffix" {
  description = "Unique suffix for the S3 bucket name"
  type        = string
  default     = "assets-default"
}

variable "tags" {
  description = "Common tags applied to all resources via map meta-argument"
  type        = map(string)
  default     = {}
}
