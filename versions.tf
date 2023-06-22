terraform {
  required_version = ">= 1.5.0"

  required_providers {
    infoblox = {
      source  = "infobloxopen/infoblox"
      version = "2.1.0"
    }
  }
}
