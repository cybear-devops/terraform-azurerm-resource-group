variable "env" {
  description = "The Shorthand Environment name for the Resource (ie: prd = production, ppe = pre-production)"
  type        = string
  default     = "prd"
}

variable "loc" {
  description = "The Shorthand Name of the Azure Region (ie: uks = UK South, ukw = UK West)"
  type        = string
  default     = "uks"
}

variable "short" {
  description = "The Shorthand Name for the Project (ie: hw = hello-world, cdo = cybear-devops)"
  type        = string
  default     = "cdo"
}
