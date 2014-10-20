require_relative 'lib/mollie'
Mollie.api_key = 'test_vIQremjwcBb9TXGQ4QbJGAazgi1e7G'

print Mollie::Resources::Issuer.all
print Mollie::Resources::Method.all