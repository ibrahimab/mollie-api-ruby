module Mollie
  module Resources
    class Base
      class << self
        attr_accessor :resource_name
      end
      
      def initialize
        @client = Mollie::Client.new
      end
      
      def self.all
        response = Mollie::Client.get(resource_inflected)
        print response.body
      end
      
      def self.find(id)
        Mollie::Client.get(resource_inflected + '/' + id)
      end
      
      def self.resource
        return self.resource_name if self.resource_name
        path = self.to_s
        name = path
        if i = path.rindex('::')
          name = path[(i+2)..-1]
        end
        self.resource_name = name.downcase
      end
      
      def self.resource_inflected
        inflect resource
      end
      
      def self.inflect(resource)
        resource + 's'
      end
    end
  end
end