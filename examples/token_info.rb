require 'ipfinder'
config = Ipfinder::config('f67f788f8a02a188ec84502e0dff066ed4413a85')

# lookup TOKEN information
data = config.getStatus()

puts data.inspect
