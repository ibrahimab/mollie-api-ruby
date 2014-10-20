Gem::Specification.new do |s|
  s.name                  = 'mollie-api-ruby'
  s.version               = '2.0.0'
  s.date                  = '2014-10-20'
  s.summary               = 'Official Mollie API Client for Ruby'
  s.description           = 'Accepting iDEAL, Mister Cash, Creditcard, PayPal, and paysafecard online payments without fixed monthly costs or any punishing registration procedures.'
  s.authors               = ['Ibrahim Abdullah', 'Rick Wong']
  s.email                 = ['ibrahim.abdullah@outlook.com', 'info@mollie.nl']
  s.files                 = `git ls-files`.split("\n")
  s.homepage              = 'https://github.com/mollie/mollie-api-ruby'
  s.required_ruby_version = '>= 1.9.2'
  s.license               = 'BSD'
  
  s.add_dependency 'faraday', '~> 0.9'
end