# frozen_string_literal: true

require 'net/http' # for URI.parse
require 'json' # for JSON.parse
require 'uri' # for URI.json and URI.encode

require 'ipfinder/errors/IPfinderException'
require 'ipfinder/Validation/Asnvalidation'
require 'ipfinder/Validation/Domainvalidation'
require 'ipfinder/Validation/Firewallvalidation'
require 'ipfinder/Validation/Ipvalidation'
require 'ipfinder/Validation/Tokenvalidation'
require 'ipfinder/info'

# Namespace for Ipfinder
# @since 1.0.0
module Ipfinder
  class << self
    def config(token = nil, baseUrl = nil)
      Ipfinder.new(token, baseUrl)
    end
  end

  # The IPfinder library main class.
  # @author Mohamed Ben rebia <mohamed@ipfinder.io>
  # @see      https://ipfinder.io
  # @since 1.0.0

  class Ipfinder
    # Public: [String] DEFAULT BASE URL
    DEFAULT_BASE_URL  = 'https://api.ipfinder.io/v1/'

    # Public: String The free token
    DEFAULT_API_TOKEN = 'free'

    # Public: String DEFAULT FORMAT
    FORMAT            = 'json'

    # Public: String service status path
    STATUS_PATH      = 'info'

    # Public: String IP Address Ranges path
    RANGES_PATH      = 'ranges/'

    # Public: String Firewall path
    FIREWALL_PATH = 'firewall/'

    # Public: String  Domain IP path
    DOMAIN_PATH = 'domain/'

    # Public: String  Domain IP history path
    DOMAIN_H_PATH = 'domainhistory/'

    # Public: String Domain By ASN, Country,Ranges path
    DOMAIN_BY_PATH = 'domainby/'
    # Constructor
    #
    # @param token   [String]  your token
    # @param baseUrl [String] proxy pass
    # @raise [IPfinderException]
    def initialize(token = nil, baseUrl = nil)
      if token.nil?
        @token = DEFAULT_API_TOKEN
      else
        Tokenvalidation.validate(token)
        @token = token
  end

      @baseUrl = if baseUrl.nil?
                   DEFAULT_BASE_URL
                 else
                   baseUrl
                 end
        end

    # Make the call to server
    #
    # @param path   [String]  specific path of asn, IP address, ranges, Firewall,Token status
    # @param format [String] available format `json` `jsonp` `php` `xml`
    # @raise [IPfinderException]
    # @return  Your IP address data.
    # @example
    #   API.call("google.com", 'php')
    def call(path = nil, format = nil)
      @format = if format.nil?
                  FORMAT
                else
                  format
                end

      @path = if path.nil?
                ''
              else
                path
              end

      @endpoint = @baseUrl + @path

      uri = URI.parse(@endpoint)
      request = Net::HTTP::Post.new(uri)
      request.content_type = 'application/json'
      request['User-Agent'] = 'IPfinder ruby-client'
      request.body = JSON.dump(
        'token' => @token,
        'format' => @format
      )

      req_options = {
        use_ssl: uri.scheme == 'https'
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      if response.code != '200'
        raise IPfinderException, "\nURL: #{@endpoint} => status code: #{response.code} \n" + response.body
        puts
      end

      details = JSON.parse(response.body, symbolize_names: true)

      Info.new(details)
    end

    # Get details for an Your IP address.
    # @return  Your IP address data.
    # @example
    #   API.Authentication()
    def Authentication
      call('', '')
    end

    # Get details for an IP address.
    #
    # @param path  [String] IP address.
    # @raise [IPfinderException]
    # @return  IP address data.
    # @example
    #   API.getAddressInfo('(IPV4|IPV6)')
    def getAddressInfo(path)
      Ipvalidation.validate(path)
      call(path)
    end

    # Get details for an AS number.
    #
    # @param path  [String]AS number.
    # @raise [IPfinderException]
    # @return  AS number data.
    # @example
    #   API.getAsn('AS1')
    def getAsn(path)
      Asnvalidation.validate(path)
      call(path)
    end

    # Get details for an API Token .
    # @return   The Token data.
    # @example
    #   API.getStatus()
    def getStatus
      call(STATUS_PATH)
    end

    # Get details for an Organization name.
    #
    # @param path  [String] Organization name.
    # @return    Organization name data.
    # @example
    #   API.getRanges('Telecom Algeria')
    def getRanges(path)
      @urlencode = URI.encode(path)
      call(RANGES_PATH + @urlencode)
    end

    # Get Firewall data
    #
    # @param by   [String] AS number, alpha-2 country only.
    # @param format [String]  formats list formats supported
    # @raise [IPfinderException]
    # @return  Firewall data.
    # @example
    #   API.getFirewall("DZ",'nginx_deny')
    def getFirewall(by, format)
      Firewallvalidation.validate(by, format)
      call(FIREWALL_PATH + by, format)
    end

    # Get Domain IP
    # @param path  [String]   The API supports passing in a single website name domain name
    # @return  Domain to IP data.
    # @example
    #   API.getDomain('google.com')
    def getDomain(path)
      Domainvalidation.validate(path)
      call(DOMAIN_PATH + path)
    end

    # Get Domain History
    #
    # @param path  [String]  The API supports passing in a single website name domain name
    # @raise [IPfinderException]
    # @return  Domain History data.
    # @example
    #   API.getDomain('google.com')
    def getDomainHistory(path)
      Domainvalidation.validate(path)
      call(DOMAIN_H_PATH + path)
    end

    # Get list Domain By ASN, Country,Ranges
    #
    # @param by  [String]  by The API supports passing in a single ASN,Country,Ranges
    # @return  Get list Domain By ASN, Country,Ranges
    # @example
    #    API.getDomain('DZ')
    def getDomainBy(by)
      call(DOMAIN_BY_PATH + by)
    end
 end

end
