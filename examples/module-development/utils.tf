data "http" "client_ip" {
  url = "https://checkip.amazonaws.com"
}

variable "Regions" {
  type = map(string)
  default = {
    uks = "UK South"
    ukw = "UK West"
    eus = "East US"
    euw = "West Europe"
  }
  description = "Converts the Shorthand Region Name to Longhand Region Name via lookup on map list"
}

variable "Environments" {
  type = map(string)
  default = {
    prd = "Production"
    ppe = "Pre-Production"
    tst = "Test"
    dev = "Development"
  }
  description = "Converts the Shorthand Environment Name to Longhand Environment Name via lookup on map list"
}

locals {
  location = lookup(var.Regions, var.loc, "UK South")
  environment = lookup(var.Environments, var.env, "Production" )
}

data "external" "detect_os" {
  working_dir = path.module
  program     = ["printf", "{\"os\": \"Linux\"}"]
}