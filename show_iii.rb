require 'yaml'

yml = YAML.load_file 'records.yml'

def iii(domain, region, kinds)
  to = kinds.delete('to')
  raise if to.nil?
  xs = []
  kinds.each do |kind, hosts|
    hosts.each do |host|
      xs << "#{host}.#{kind[0]}.#{region}.iii"
      xs << "#{host}.#{kind[0]}.#{region[0]}.iii"
      xs << "#{host}.#{kind}.#{region}.iii"
    end
  end

  xs.map { |s| s + '.dark-kuins.net' }
end


yml.each do |domain, v|
  v&.each do |region, v|
    if region == 'iii'
      v&.each do |region, kinds|
        puts iii(domain, region, kinds)
      end
    end
  end
end
