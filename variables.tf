variable "prefix" {
  type = string
  description = "the desired prefix for all the variables"
  default = "demo"
}
variable "env" {
  type = string
  description = "the name of the environment"
  default = "dev"
}

variable "vnetCIDR" {
  type = list
  description = "Ip Range of vnet CiDR"
  default = ["10.0.0.0/16"]
}
variable "dnsServer" {
  type = list
  default = ["10.0.0.4", "10.0.0.5"]
}

variable "bastionCIDR" {
  type =list
  description = "ip range of bastion subnet"
  default = ["10.0.1.0/24"]
}

variable "webCIDR" {
  type =list
  description = "ip range of web subnet"
  default = ["10.0.15.0/24"]
}

variable "AppCIDR" {
  type =list
  description = "ip range of web subnet"
  default = ["10.0.20.0/24"]
}
variable "dbCIDR" {
  type =list
  description = "ip range of web subnet"
  default = ["10.0.25.0/24"]
}
variable "apiCIDR" {
  type =list
  description = "ip range of web subnet"
  default = ["10.0.35.0/24"]
}
//Variable declaration
variable "pubKeyPath"{

}
variable "bastionVmSize" {
  
}
variable "username" {
  
}