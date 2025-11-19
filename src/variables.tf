variable "my-os-image" {
  type = string
  description = "here i am storging my aws ami id"
  # default = "ami-0cae6d6fe6048ca2c"
}

variable "machine_size" {
  type = string
  # default = "t2.nano"
}

variable "vm_name" {
  type = string
  # default = "vince-vm-day"
}

variable "my_asw_region" {
  type = string
  # default = "us-east-1"
}

variable "private_key_name" {
  type = string
  # default = "splunk-key"
}
