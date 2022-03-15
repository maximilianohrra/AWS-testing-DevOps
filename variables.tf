variable "region" {
  description = "AWS Region"
  default     = "us-west-1"
}

variable "aws_access_key" {
  description = "AWS access key"
  default = "AKIAXGJ4BXXKUJQYMLNX"
  
}

variable "aws_secret_key" {
  description = "AWS secret key"
  default = "PViU9FsoIfVA9WhYlXIBECdI3yb1hJ77gDwJpnXG"
}

variable "vpc_cidr_block" {
  description = "VPC network"
  default     = "10.1.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "Public Subnet"
  default     = "10.1.1.0/24"
}

variable "private_subnet_cidr_block" {
  description = "Private Subnet"
  default     = "10.1.2.0/24"
}


variable "availability_zones" {
  description = "Availability Zones"
  default     = "us-west-1a,us-west-1b,us-west-1c"
}

variable "ecs_cluster_name" {
  description = "ECS cluster Name"
  default     = "ECS-cluster-for-wordpress"
}

variable "amis" {
  description = "ECS Container Instances AMIs"
  default = {
    ap-northeast-1 = "ami-7e4a5b10"
    ap-southeast-1 = "ami-be63a9dd"
    ap-southeast-2 = "ami-b8cbe8db"
    eu-central-1   = "ami-9aeb0af5"
    eu-west-1      = "ami-9c9819ef"
    us-east-1      = "ami-67a3a90d"
    us-west-1      = "ami-b7d5a8d7"
    us-west-2      = "ami-c7a451a7"
  }
}

variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}

variable "db_instance_type" {
  description = "RDS instance type"
  default = "db.t2.micro"
}


variable "db_name" {
  description = "RDS DB name"
  default = "wordpressdb"
}

variable "db_user" {
  description = "RDS DB username"
  default = "ecs"
}

variable "db_password" {
  description = "RDS DB password"
  default = "Qwerty12345-"
}

variable "wp_title" {
  description = "Wordpress title"
  default = "My Wordpress on ECS"
}

variable "wp_user" {
  description = "Wordpress username"
  default = "admin"
}

variable "wp_password" {
  description = "Wordpress password"
  default = "Qwerty12345-"
}

variable "wp_mail" {
  description = "Wordpress email"
  default = "joan.fuster@gmail.com"
}

###

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = 1024
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = 2048
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 80
}
variable "docker_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "wordpress"
}