require 'yaml'

yml = YAML.load_file 'records.yml'

@resource = 'cloudflare_record'
@domains = {
  'dark-kuins.net' => {
    zone_id: 'var.dark-kuins_zone',
    suffix: '${var.dark-kuins-net}',
  },
  'nna774.net' => {
    zone_id: 'var.nna774_zone',
    suffix: '${var.nna774-net}',
  },
}

def build(r)
  str = <<EOS
resource "#{@resource}" "#{r[:key]}" {
  zone_id = #{@domains[r[:domain]][:zone_id]}
  name   = "#{r[:name]}.#{@domains[r[:domain]][:suffix]}"
  value  = "#{r[:value]}"
  type   = "#{r[:type]}"
  proxied = false
}
EOS

  str
end

def f(domain, region, kind, host, value)
  xs = []
  cname = value['cname']
  cname_suf = ''
  if !cname.nil?
    cname_suf = '-cname'
    xs << {
      key: "#{host}-cname",
      name: "#{host}.#{kind}.#{region}",
      value: cname,
      type: 'CNAME',
      domain: domain,
    }
  end
  xs << {
    key: "#{host}#{cname_suf}-short",
    name: "#{host}.#{kind[0]}.#{region}",
    value: "#{host}.#{kind}.#{region}.${var.dark-kuins-net}",
    type: 'CNAME',
    domain: domain,
  }
  xs << {
    key: "#{host}#{cname_suf}-very-short",
    name: "#{host}.#{kind[0]}.#{region[0]}",
    value: "#{host}.#{kind}.#{region}.${var.dark-kuins-net}",
    type: 'CNAME',
    domain: domain,
  }
  v4 = value['v4']
  if !v4.nil?
    xs << {
      key: host,
      name: "#{host}.#{kind}.#{region}",
      value: v4,
      type: 'A',
      domain: domain,
    }
    xs << {
      key: "#{host}-force-v4",
      name: "v4.#{host}.#{kind}.#{region}",
      value: v4,
      type: 'A',
      domain: domain,
    }
    xs << {
      key: "#{host}-force-v4-short",
      name: "v4.#{host}.#{kind[0]}.#{region}",
      value: "v4.#{host}.#{kind}.#{region}.${var.dark-kuins-net}",
      type: 'CNAME',
      domain: domain,
    }
    xs << {
      key: "#{host}-force-v4-very-short",
      name: "v4.#{host}.#{kind[0]}.#{region[0]}",
      value: "v4.#{host}.#{kind}.#{region}.${var.dark-kuins-net}",
      type: 'CNAME',
      domain: domain,
    }
  end
  v6 = value['v6']
  if !v6.nil?
    xs << {
      key: "#{host}-6",
      name: "#{host}.#{kind}.#{region}",
      value: v6,
      type: 'AAAA',
      domain: domain,
    }
    xs << {
      key: "#{host}-force-v6",
      name: "v6.#{host}.#{kind}.#{region}",
      value: v6,
      type: 'AAAA',
      domain: domain,
    }
    xs << {
      key: "#{host}-force-v6-short",
      name: "v6.#{host}.#{kind[0]}.#{region}",
      value: "v6.#{host}.#{kind}.#{region}.${var.dark-kuins-net}",
      type: 'CNAME',
      domain: domain,
    }
    xs << {
      key: "#{host}-force-v6-very-short",
      name: "v6.#{host}.#{kind[0]}.#{region[0]}",
      value: "v6.#{host}.#{kind}.#{region}.${var.dark-kuins-net}",
      type: 'CNAME',
      domain: domain,
    }
  end

  xs.map(&method(:build))
end

def iii(domain, region, kinds)
  to = kinds.delete('to')
  raise if to.nil?
  xs = []
  kinds.each do |kind, hosts|
    hosts.each do |host|
      xs << {
        key: "iii-#{host}-short",
        name: "#{host}.#{kind[0]}.#{region}.iii",
        value: "#{host}.#{kind}.#{region}.iii.${var.dark-kuins-net}",
        type: 'CNAME',
        domain: domain,
      }
      xs << {
        key: "iii-#{host}-very-short",
        name: "#{host}.#{kind[0]}.#{region[0]}.iii",
        value: "#{host}.#{kind}.#{region}.iii.${var.dark-kuins-net}",
        type: 'CNAME',
        domain: domain,
      }
      xs << {
        key: "iii-#{host}",
        name: "#{host}.#{kind}.#{region}.iii",
        value: to,
        type: 'CNAME',
        domain: domain,
      }
    end
  end

  xs.map(&method(:build))
end

def esc(name)
  name.gsub(/\./, ?-)
end

def acm_iii(domain, from, to)
  acm(domain, from + '.iii', to)
end

def acm(domain, from, to)
  cname_imp(domain, "acm-validation-#{esc(from)}", from, to)
end

def cname(domain, from, to)
  cname_imp(domain, "cname-#{esc(domain)}-#{esc(from)}", from, to)
end

def cname_imp(domain, key, from, to)
  build({
    key: key,
    name: from,
    value: to,
    type: 'CNAME',
    domain: domain,
  })
end

def txt(domain, from, val)
  build({
    key: "txt-#{esc(domain)}-#{esc(from)}",
    name: from,
    value: val,
    type: 'TXT',
    domain: domain
  })
end

yml.each do |domain, v|
  v&.each do |region, v|
    if region == 'iii'
      v&.each do |region, kinds|
        puts iii(domain, region, kinds)
      end
    elsif region == 'acm_iii'
      v&.each do |from, to|
        puts acm_iii(domain, from, to)
      end
    elsif region == 'acm'
      v&.each do |from, to|
        puts acm(domain, from, to)
      end
    elsif region == 'cname'
      v&.each do |from, to|
        puts cname(domain, from, to)
      end
    elsif region == 'txt'
      v&.each do |from, val|
        puts txt(domain, from, val)
      end
    else
      v&.each do |kind, hosts|
        hosts&.each do |host, value|
          puts f(domain, region, kind, host, value || {})
        end
      end
    end
  end
end
