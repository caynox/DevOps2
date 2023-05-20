variable "aws_access_key" {
  description = "AWS Access Key"
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
}

variable "aws_region" {
  description = "AWS Region"
  default     = "eu-north-1"  
}

variable "vpc_cidr_block" {
  description = "CIDR блок для VPC"
  type        = string
}

variable "subnet_cidr_block" {
  description = "CIDR блок для підмережі"
  type        = string
}

variable "aws_availability_zone" {
  description = "Зона доступності AWS"
  type        = string
}

variable "ec2_ami" {
  description = "AMI для EC2 інстансів"
  type        = string
}

variable "ec2_instance_type" {
  description = "Тип EC2 інстансу"
  type        = string
  default     = "t2.micro" 
}

variable "ec2_key_name" {
  description = "Назва ключа EC2"
  type        = string
  default     = "your-key-pair"  
}


