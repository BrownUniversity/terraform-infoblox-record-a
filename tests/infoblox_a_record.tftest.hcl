variables {
        record_hostname = "tftest"
        record_domain = "jupyter.brown.edu"
        record_ip = "127.0.0.1"
        record_dns_view = "production"
}

run "infoblox_a_record_test" {

    module {
        source = "./tests/production-record"
    }

    assert {
        condition = output.fqdn != null
        error_message = "DNS record not created."
    }

    assert {
        condition = output.id != null
        error_message = "No record created in Infoblox"
    }

    assert {
        condition = startswith(module.production_infoblox_record.fqdn, var.record_hostname)
        error_message = "DNS record hostname does not match variable value"
    }

    assert {
        condition = strcontains(module.production_infoblox_record.fqdn, var.record_domain)
        error_message = "Record not created in target DNS zone"
    }

    assert {
        condition = output.view == var.record_dns_view
        error_message = "Record not created in correct DNS view"
    }

    assert {
        condition = output.ip_address == var.record_ip
        error_message = "DNS name is not set to specified IP"
    }
}