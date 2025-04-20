variable "region" {
  description = "The region in which the resources will be deployed"
  default     = "us-east-2"

}


variable "instance_type" {
    description = "The instance type to use for the EC2 instance"
    default = "t2.medium"
        
    
}
variable "ami" {
  description = "The AMI to use for the EC2 instance"
  default     = "ami-0884d2865dbe9de4b"

}

variable "aws_key_name" {
  description = "The name of the key pair to use for the EC2 instance"
  default     = "terraform-key"
  
}

variable "aws_vpc" {
  description = "This is a dedicated VPC for the Jenkins server"
  default = "10.0.0.0/16"
}