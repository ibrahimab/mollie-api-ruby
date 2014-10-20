require 'faraday'
require 'openssl'

module Mollie
  class Client
    class << self
      attr_accessor :ssl_options, :headers
    end
    API_ENDPOINT = 'https://api.mollie.nl'
    API_VERSION  = 'v1'
    
    def self.api_uri
      "#{API_ENDPOINT}/#{API_VERSION}" 
    end
    
    def self.get(path)
      Faraday.get("#{self.api_uri}/#{path}", ssl: {verify: false}) do |request|
        request.headers = get_headers
      end
    end
    
    def self.post(path, params)
      Faraday.post do |request|
        # setup request URL
        request.url "#{self.api_uri}/#{path}"
        
        request.body    = params
        request.headers = get_headers
      end
    end
    
    def self.get_headers
      return self.headers if self.headers
      
      openssl_version = OpenSSL::OPENSSL_VERSION.split(' ').slice(0, 2).join('/')
      user_agent      = "Mollie/#{Mollie::VERSION} Ruby/#{RUBY_VERSION} #{openssl_version}"
      
      self.headers    = {accept: 'json', authorization: "Bearer #{Mollie.api_key}", user_agent: user_agent, 'X-Mollie-Client-Info' => "Mollie API: #{Mollie::VERSION}; Ruby: #{RUBY_VERSION}"}
    end
    
    def ssl_options
      return self.ssl_options if self.ssl_options
      self.ssl_options = {verify: true, ca_file: (File.expand_path 'cacert.pem', File.dirname(__FILE__))}
    end
  end
end