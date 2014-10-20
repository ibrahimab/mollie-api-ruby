require_relative './mollie/client'
require_relative './mollie/resources/base'
require_relative './mollie/resources/issuer'
require_relative './mollie/resources/method'

module Mollie
  VERSION = '2.0.0'
  class << self
    attr_accessor :api_key
  end
end