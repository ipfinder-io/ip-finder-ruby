<img src='https://camo.githubusercontent.com/46886c3e689a0d4a3f6c0733d1cab5d9f9a3926d/68747470733a2f2f697066696e6465722e696f2f6173736574732f696d616765732f6c6f676f732f6c6f676f2e706e67' height='60' alt='IP Finder'></a>
#  IPFinder Ruby Client Library
[![Gem Version](https://badge.fury.io/rb/Ipfinder.svg)](https://badge.fury.io/rb/Ipfinder)


official Ruby library for IPfinder for the [IPFinder.io](https://ipfinder.io) get details for :
-  IP address details (city, region, country, postal code, latitude and more ..)
-  ASN details (Organization name, registry,domain,comany_type, and more .. )
-  Firewall by supported formats details (apache_allow,  nginx_deny, CIDR , and more ..)
-  IP Address Ranges by the Organization name  details (list_asn, list_prefixes , and more ..)
-  service status details (queriesPerDay, queriesLeft, key_type, key_info)
- Get Domain IP (asn, organization,country_code ....)
- Get Domain IP history (total_ip, list_ip,organization,asn ....)
- Get list Domain By ASN, Country,Ranges (select_by , total_domain  , list_domain ....)

## Getting Started
singup for a free account at [https://ipfinder.io/auth/signup](https://ipfinder.io/auth/signup), for Free IPFinder API access token.

The free plan is limited to 4,000 requests a day, and doesn't include some of the data fields
To enable all the data fields and additional request volumes see [https://ipfinder.io/pricing](https://ipfinder.io/pricing).

## Documentation

See the [official documentation](https://ipfinder.io/docs).

## Installation
Installing using gem:
```shell
gem install Ipfinder
```

## With `free` TOKEN

```ruby
require 'ipfinder'
config = Ipfinder::config() #  emty token == free

# lookup your IP address information
auth = config.Authentication()

puts auth.inspect

puts auth.ip # your ip

```

## Authentication

```ruby
require 'ipfinder'
config = Ipfinder::config('YOUR_TOKEN_GOES_HERE')

# lookup your IP address information
puts auth.inspect

puts auth.ip # your ip

```

## Get IP address

```ruby
require 'ipfinder'
config = Ipfinder::config('YOUR_TOKEN_GOES_HERE')

# GET Get details for 1.0.0.0
ip_address = '1.0.0.0'

# lookup IP address information
ip = config.getAddressInfo('1.0.0.0')

puts ip.inspect
```

## Get ASN
This API available as part of our Pro and enterprise [https://ipfinder.io/pricing](https://ipfinder.io/pricing).

```ruby
require 'ipfinder'
config = Ipfinder::config('YOUR_TOKEN_GOES_HERE')

asn = 'as36947'

# lookup Asn information
asn = config.getAsn(asn)

puts asn.inspect
```

## Firewall
This API available as part of our  enterprise [https://ipfinder.io/pricing](https://ipfinder.io/pricing).
formats supported are :  `apache_allow`, `apache_deny`,`nginx_allow`,`nginx_deny`, `CIDR`, `linux_iptables`, `netmask`, `inverse_netmask`, `web_config_allow `, `web_config_deny`, `cisco_acl`, `peer_guardian_2`, `network_object`, `cisco_bit_bucket`, `juniper_junos`, `microtik`

```ruby
require 'ipfinder'
config = Ipfinder::config('YOUR_TOKEN_GOES_HERE')

asn = 'as36947'

asn = 'as36947'
format = 'nginx_deny'
# lookup Asn Firewall information

firewall = config.getFirewall(asn, format)

puts firewall.inspect
```

## Get IP Address Ranges
This API available as part of our  enterprise [https://ipfinder.io/pricing](https://ipfinder.io/pricing).

```ruby
require 'ipfinder'
config = Ipfinder::config('YOUR_TOKEN_GOES_HERE')

# Organization name
org = 'Telecom Algeria'

# lookup Organization information
range = config.getRanges(org)

puts range.inspect
```

## Get service status

```ruby
require 'ipfinder'
config = Ipfinder::config('YOUR_TOKEN_GOES_HERE')

# lookup IP TOKEN information
data = config.getStatus()

puts data.inspect
```

## Get Domain IP


```ruby
require 'ipfinder'
config = Ipfinder::config('YOUR_TOKEN_GOES_HERE')

# lookup domain name data
name = 'google.com'

domain = config.getDomain(name)

puts domain.inspect
```

## Get Domain IP history



```ruby
require 'ipfinder'
config = Ipfinder::config('YOUR_TOKEN_GOES_HERE')

# lookup domain name IP history
name = 'google.com'

data = config.getDomainHistory(name)

puts data.inspect
```

## Get list Domain By ASN, Country,Ranges


```ruby
require 'ipfinder'
config = Ipfinder::config('YOUR_TOKEN_GOES_HERE')

# lookup  live list domain by country DZ,US,TN,FR,MA
by = 'DZ'

dby = config.getDomainBy(by)

puts dby.inspect
```

## Add proxy
```ruby
require 'ipfinder'
config = Ipfinder::config('YOUR_TOKEN_GOES_HERE','https://ipfinder.yourdomain.com')
```

Sample codes under **examples/** folder.


## Contact

Contact Us With Additional Questions About Our API, if you would like more information about our API that isn’t available in our IP geolocation API developer documentation, simply [contact](https://ipfinder.io/contact) us at any time and we’ll be able to help you find what you need.

## License
----

[![GitHub license](https://img.shields.io/github/license/ipfinder-io/ip-finder-ruby.svg)](https://github.com/ipfinder-io/ip-finder-ruby)
