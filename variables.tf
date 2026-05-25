variable "aws_instance_type" {
    default = "t2.micro"
    type = string 
}

variable "volume_size" {
  type        = number
  default     = "15"

}

variable "ami" {
  type        = string
  default     = "ami-05d2d839d4f73aafb"
}

variable "env" {
  default = "prd"
  type = string

}

