terraform {
  required_version = ">= 1.2.5"

  required_providers {
    infoblox = {
      source  = "infobloxopen/infoblox"
      version = ">= 2.0.1, <3.0.0"
    }
  }
}
