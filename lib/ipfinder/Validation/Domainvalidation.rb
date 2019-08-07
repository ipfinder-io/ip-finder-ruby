
# Namespace for Ipfinder
# @since 1.0.0
module Ipfinder
  # class Domainvalidation
  class Domainvalidation
  	# Helper method for validating domain name
    # @param domain [String] passing in a single website name domain name
  	# @raise [IPfinderException]
  	# @return [true]
    # @see  for regex domain name.
    # @see https://github.com/ipfinder-io/ip-finder-php/blob/master/src/Validation/Domainvalidation.php
    def self.validate(domain)
      if domain =~ /^(?!\-)(?:[a-zA-Z\d\-]{0,62}[a-zA-Z\d]\.){1,126}(?!\d+)[a-zA-Z\d]{1,63}$/
        true
      else
        raise IPfinderException, 'Invalid Domain name'
      end
    end
  end
end
