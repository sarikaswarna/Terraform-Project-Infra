variable "region" {
    type    = string
    default = "us-east-2"
} 

variable "AZ-1a" {
    type = string
    default = "us-east-2a"
}

variable "AZ-1b" {
    type = string
    default = "us-east-2b"
}

variable "EC2-AMI" {
    type = string
    default = "ami-097a2df4ac947655f"
}

variable "key_name" {
    type = string
    default = "project-key"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}