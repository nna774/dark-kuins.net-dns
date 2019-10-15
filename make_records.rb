require 'yaml'

yml = YAML.load_file 'records.yml'

@resource = 'cloudflare_record'

def build(r)
  str = <<EOS
resource "#{@resource}" "#{r[:key]}" {
  zone_id = "${var.dark-kuins_zone}"
  name   = "#{r[:name]}.${var.dark-kuins-net}"
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
    }
  end
  xs << {
    key: "#{host}#{cname_suf}-short",
    name: "#{host}.#{kind[0]}.#{region}",
    value: "#{host}.#{kind}.#{region}.${var.dark-kuins-net}",
    type: 'CNAME',
  }
  xs << {
    key: "#{host}#{cname_suf}-very-short",
    name: "#{host}.#{kind[0]}.#{region[0]}",
    value: "#{host}.#{kind}.#{region}.${var.dark-kuins-net}",
    type: 'CNAME',
  }
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
      value: "v4.#{host}.#{kind}.#{region}.${var.dark-kuins-net}",
      type: 'CNAME',
    }
    xs << {
      key: "#{host}-force-v4-very-short",
      name: "v4.#{host}.#{kind[0]}.#{region[0]}",
      value: "v4.#{host}.#{kind}.#{region}.${var.dark-kuins-net}",
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
      value: "v6.#{host}.#{kind}.#{region}.${var.dark-kuins-net}",
      type: 'CNAME',
    }
    xs << {
      key: "#{host}-force-v6-very-short",
      name: "v6.#{host}.#{kind[0]}.#{region[0]}",
      value: "v6.#{host}.#{kind}.#{region}.${var.dark-kuins-net}",
      type: 'CNAME',
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
      }
      xs << {
        key: "iii-#{host}-very-short",
        name: "#{host}.#{kind[0]}.#{region[0]}.iii",
        value: "#{host}.#{kind}.#{region}.iii.${var.dark-kuins-net}",
        type: 'CNAME',
      }
      xs << {
        key: "iii-#{host}",
        name: "#{host}.#{kind}.#{region}.iii",
        value: to,
        type: 'CNAME',
      }
    end
  end

  xs.map(&method(:build))
end

def acm_iii(from, to)
  build({
    key: "acm-validation-#{from.gsub(/\./, '-')}",
    name: from + '.iii',
    value: to,
    type: 'CNAME',
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
        puts acm_iii(from, to)
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
