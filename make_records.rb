require 'yaml'

yml = YAML.load_file 'records.yml'

@resource = 'cloudflare_record'

def build(r)
  str = <<EOS
resource "#{@resource}" "#{r[:key]}" {
  domain = "${var.cloudflare_domain}"
  name   = "#{r[:name]}.${var.cloudflare_domain}"
  value  = "#{r[:value]}"
  type   = "#{r[:type]}"
  proxied = false
}
EOS
  
  str
end

def f(domain, region, kind, host, value)
  xs = []
  xs << {
    key: "#{host}-short",
    name: "#{host}.#{kind[0]}.#{region}",
    value: "#{host}.#{kind}.#{region}.${var.cloudflare_domain}",
    type: 'CNAME',
  }
  xs << {
    key: "#{host}-very-short",
    name: "#{host}.#{kind[0]}.#{region[0]}",
    value: "#{host}.#{kind}.#{region}.${var.cloudflare_domain}",
    type: 'CNAME',
  }
  cname = value['cname']
  if !cname.nil?
    xs << {
      key: host,
      name: "#{host}.#{kind}.#{region}",
      value: cname,
      type: 'CNAME',
    }
  end
  v4 = value['v4']
  if !v4.nil?
    xs << {
      key: host,
      name: "#{host}.#{kind}.#{region}",
      value: v4,
      type: 'A',
    }
    xs << {
      key: "#{host}-force-v4",
      name: "v4.#{host}.#{kind}.#{region}",
      value: v4,
      type: 'A',
    }
    xs << {
      key: "#{host}-force-v4-short",
      name: "v4.#{host}.#{kind[0]}.#{region}",
      value: "v4.#{host}.#{kind}.#{region}.${var.cloudflare_domain}",
      type: 'CNAME',
    }
    xs << {
      key: "#{host}-force-v4-very-short",
      name: "v4.#{host}.#{kind[0]}.#{region[0]}",
      value: "v4.#{host}.#{kind}.#{region}.${var.cloudflare_domain}",
      type: 'CNAME',
    }
  end
  v6 = value['v6']
  if !v6.nil?
    xs << {
      key: "#{host}-6",
      name: "#{host}.#{kind}.#{region}",
      value: v6,
      type: 'AAAA',
    }
    xs << {
      key: "#{host}-force-v6",
      name: "v6.#{host}.#{kind}.#{region}",
      value: v6,
      type: 'AAAA',
    }
    xs << {
      key: "#{host}-force-v6-short",
      name: "v6.#{host}.#{kind[0]}.#{region}",
      value: "v6.#{host}.#{kind}.#{region}.${var.cloudflare_domain}",
      type: 'CNAME',
    }
    xs << {
      key: "#{host}-force-v6-very-short",
      name: "v6.#{host}.#{kind[0]}.#{region[0]}",
      value: "v6.#{host}.#{kind}.#{region}.${var.cloudflare_domain}",
      type: 'CNAME',
    }
  end

  xs.map(&method(:build))
end

yml.each do |domain, v|
  v&.each do |region, v|
    v&.each do |kind, hosts|
      hosts&.each do |host, value|
        puts f(domain, region, kind, host, value)
      end
    end
  end
end
