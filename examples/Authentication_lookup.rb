require 'ipfinder'
config = Ipfinder::config('f67f788f8a02a188ec84502e0dff066ed4413a85')

# lookup your IP address information
auth = config.Authentication()

puts auth.inspect
