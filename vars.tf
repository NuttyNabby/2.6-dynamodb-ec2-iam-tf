variable "instance_name" {
  description = "Name of the EC2 instance"
  default     = "nabilah-dynamodb-reader"
}

variable "ami_id" {
  description = "AMI ID for Amazon Linux 2023"
  default     = "ami-085ad6ae776d8f09c"  # Replace with the actual AMI ID for your region
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "vpc_id" {
  description = "VPC ID where the instance will be deployed"
  default    = "255945442255"
}

variable "subnet_id" {
  description = "Subnet ID for the instance"
  default     = "subnet-076eb0c119c270f7c" 
}

variable "your_ip" {
  description = "Your home IP address for SSH access"
  default      = "44.192.88.34"

}

variable "key_name" {
  description = "Name of the SSH key pair"
  default        = "nabilahkeypair"
}

variable "iam_instance_profile" {
  description = "IAM instance profile to attach to the EC2 instance"
  default          = "nabilah_dynamodb_policy"
}

# variables.tf
variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "account_id" {
  description = "AWS account ID"
  default     = "255945442255"
}

variable "table_name" {
  description = "DynamoDB table name"
  default     = "nabilah-bookinventory"
}
