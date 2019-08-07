require 'ipfinder'
config = Ipfinder::config('f67f788f8a02a188ec84502e0dff066ed4413a85')

asn = 'as36947'
format = 'nginx_deny'
# lookup Firewall information

firewall = config.getFirewall(asn, format)

puts firewall.inspect
