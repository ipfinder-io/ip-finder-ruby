
# Namespace for Ipfinder
# @since 1.0.0
module Ipfinder
  # class Asnvalidation
  class Asnvalidation
  	# Helper method for validating an argument if it is asn number
    # @param asn [String]  The AS number you want details for
  	# @raise [IPfinderException]
  	# @return [true]
  	# @see  for regex asn number.
  	# @see https://github.com/ipfinder-io/ip-finder-php/blob/master/src/Validation/Asnvalidation.php/
    def self.validate(asn)
      if asn =~ /^(as|AS)(\d+)$/
        true
      else
        raise IPfinderException, 'Invalid asn number'
      end
    end
  end
end
