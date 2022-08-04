title "Test creation of an a-record"

ip_address = attribute("ip_address")
fqdn = attribute("fqdn")

describe host(fqdn) do
  it { should be_resolvable }
  its('ipaddress') { should include ip_address}
end