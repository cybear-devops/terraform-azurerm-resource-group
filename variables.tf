variable "location" {
  type        = string
  description = "The Location (region) this resource should be put in (ie: uksouth)"
}

variable "lock_level" {
  type        = string
  description = "Specifies the Lock Level to be used, possibly values are Empty (no lock), `CanNotDelete` and `ReadOnly`."
  default     = null
  validation {
    condition     = var.lock_level != "CanNotDelete" || var.lock_level != "ReadOnly"
    error_message = "The only accepted parameters for lock_level is are `CanNotDelete` and `ReadOnly`."
  }
}

variable "rg_name" {
  description = "The name of the Resource Group, this module does not create a resource group, it is expecting the value of a resource group already exists"
  type        = string
  validation {
    condition     = length(var.rg_name) > 1 && length(var.rg_name) <= 24
    error_message = "Resource Group Name is not valid"
  }
}

variable "tags" {
  type        = map(string)
  description = "A map of the Tags to use on the resources that are deployed with this module"
}
