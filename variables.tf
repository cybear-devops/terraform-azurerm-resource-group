variable "location" {
  type        = string
  description = "(Required) The Azure Region where the Resource should exist (ie: UK South)"
}

variable "lock_level" {
  type        = string
  description = " (Required) Specifies the Level to be used for this Lock. Possibly values are Empty (no lock), `CanNotDelete` and `ReadOnly`"
  default     = null
  validation {
    condition     = var.lock_level != "CanNotDelete" || var.lock_level != "ReadOnly"
    error_message = "The only accepted parameters for lock_level is are `CanNotDelete` and `ReadOnly`"
  }
}

variable "managed_by" {
  type        = string
  description = "(Optional) The ID of the resource or application that manages this Resource"
  default     = null
}

variable "name" {
  description = "(Required) The Name which should be used for this Resource"
  type        = string
  validation {
    condition     = length(var.name) > 1 && length(var.name) <= 24
    error_message = "Resource Name is not valid"
  }
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags which should be assigned to the Resource"
}
