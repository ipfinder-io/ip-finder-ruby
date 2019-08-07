
# Namespace for Ipfinder
# @since 1.0.0
module Ipfinder
  # class Tokenvalidation
  class Tokenvalidation
  	# Helper method for validating IPFINDER API TOKEN
    # @param token [String] token Your API key or the string "free" for the free API
  	# @raise [IPfinderException]
  	# @return [true]
    def self.validate(token)
      raise IPfinderException, 'Invalid IPFINDER API Token' if token.length < 25

      true
    end
  end
end
