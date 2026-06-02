variable "env" {
  type = string
  description = "EDMS Application Environment"  
}

variable "bucket_name" {
    type = string
    description = " EDMS Bucket Name"
}


variable "dynamodbtable_name" {
    type = string
    description = " EDMS Table Name"
}

variable "dynamodb_hashkey" {
    type = string
    description = " EDMS Table Hashkey Name"
}


variable "key_name" {
    type = string
    description = "instance keys"
}

variable "sg_name" {
    type = string
    description = "EDMS Security Groups"
}

variable "instance_count" {
    type = number
    description = "number of instances "
}

variable "ami_id" {
    type = string
    description = "AMI ID"
}

variable "volume_size" {
    type = number
    description = "Root volume size"
}

variable "instance_name" {
    type = string
    description = "Server Name"
}

variable "instance_type" {
    type = string
    description = "Server Configuration"
}
