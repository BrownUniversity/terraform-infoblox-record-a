
class Nslookup < Inspec.resource(1)
    name 'nslookup'
    desc 'Validate hostname lookup using nslookup'
    supports platform: 'unix'
  
    def initialize(addr)
      @resp = inspec.command("nslookup #{addr}")
    end
  
    def stdout
      @resp.stdout
    end
  
    def stderr
      @resp.stderr
    end
  
    def exit_status
      @resp.exit_status
    end
  
    def cname_for
      'stub value'
    end
  
    def resolvable?(type = nil)
      !@resp.stdout.include?('NXDOMAIN')
    end
  
    def cname?(type = nil)
      @resp.stdout.include?('canonical name')
    end
  end