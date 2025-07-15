terraform {
  required_version = ">= 1.12.2"

  required_providers {
    infoblox = {
      source  = "infobloxopen/infoblox"
      version = " = 2.2"
    }
  }
}
