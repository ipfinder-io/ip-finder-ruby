require 'ipfinder'
config = Ipfinder::config('f67f788f8a02a188ec84502e0dff066ed4413a85')

ip = config.getAddressInfo('1.0.0.0')

puts ip.inspect
