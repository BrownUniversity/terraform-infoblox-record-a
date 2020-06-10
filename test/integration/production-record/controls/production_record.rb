title "Test creation of an a-record"

ip_address = attribute("record_ip")
fqdn = attribute("record_fqdn")

describe nslookup(fqdn) do
  it { should be_resolvable }
  its('stdout') { should include ip_address}
end