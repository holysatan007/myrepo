variable "bizz_az1"{
  default = "ap-south-1a"
}

variable "bizz_az2"{
  default = "ap-south-1b"
}

variable "bizz_pri_cidr_all_rt"{
  default = "0.0.0.0/0"
}

variable "bizz_pub_cidr_all_rt"{
  default = "0.0.0.0/0"
}

variable "bizz_subnet_app_priv1"{
  default = "172.16.1.0/24"
}

variable "bizz_subnet_app_priv2"{
  default = "172.16.2.0/24"
}

variable "bizz_subnet_db_priv1"{
  default = "172.16.3.0/24"
}

variable "bizz_subnet_db_priv2"{
  default = "172.16.4.0/24"
}

variable "bizz_subnet_elb_pub1"{
  default = "172.16.5.0/24"
}

variable "bizz_subnet_elb_pub2"{
  default = "172.16.6.0/24"
}

variable "bizz_subnet_web_priv1"{
  default = "172.16.7.0/24"
}

variable "bizz_subnet_web_priv2"{
  default = "172.16.8.0/24"
}

variable "bizz_vpc"{
  default = "172.16.0.0/16"
}

variable "bizz_vpc_cidr_pri_rt"{
  default = "172.16.0.0/16"
}

variable "bizz_vpc_cidr_pub_rt"{
  default = "172.16.0.0/16"
}

variable "environment"{
  default = "Bizzbank UAT"
}

variable "manage"{
  default = "PremitiveKey Technology"
}

variable "name"{
  default = "Bizzbank Asset"
}

variable "opencidr"{
  default = "0.0.0.0/0"
}

variable "owner"{
  default = "PremitiveKey"
}

variable "privateip"{
  default = "172.16.5.6/32"
}

variable "region"{
  default = "ap-south-1"
}

variable "start"{
  default = "No"
}

variable "stop"{
  default = "No"
}
