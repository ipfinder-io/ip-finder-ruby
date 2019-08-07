
require 'json'

module Ipfinder
  #  Holds array data form call
  class Info
    attr_reader :all

    def initialize(response)
      # Output all details.
      @all = response

      # Output value of  key if existe.
      @all.each do |name, value|
        instance_variable_set("@#{name}", value)
        self.class.send(:attr_accessor, name)
      end
    end
  end
end
