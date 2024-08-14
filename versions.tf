terraform {
  required_version = ">= 1.9.0"

  required_providers {
    infoblox = {
      source  = "infobloxopen/infoblox"
      version = " = 2.1"
    }
  }
}
