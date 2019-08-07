require 'ipfinder'

config = Ipfinder::config('f67f788f8a02a188ec84502e0dff066ed4413a85')

name = 'google.com'

domain = config.getDomain(name)

puts domain.inspect
