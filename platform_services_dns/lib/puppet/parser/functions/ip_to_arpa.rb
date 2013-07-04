require 'ipaddr'

def convert(ip)
  IPAddr.new(ip).reverse.split('.')[1..-1].join('.')
end


module Puppet::Parser::Functions
  newfunction(:ip_to_arpa, :type => :rvalue) do |args|
    if args[0].kind_of?(Array)
      args[0].collect{|ip| convert ip }
    else
      convert(args[0])
    end
  end
end
