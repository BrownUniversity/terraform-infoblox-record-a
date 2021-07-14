terraform {
  required_version = ">= 1.0"

  required_providers {
    infoblox = {
      source  = "infobloxopen/infoblox"
      version = ">= 1.0, <2.0.0"
    }
  }
}
