Gem::Specification.new do |s|
  s.name        = 'awesome_config'
  s.version     = '1.1'
  s.summary     = 'Config stuff'
  s.authors     = 'Wallace T. Dog'
  s.description = 'A not so awesome configuration store for Derby'
  s.files       = Dir.glob('lib/**/*')
  s.homepage    = 'https://derby.com'
  s.license     = 'none'

  s.add_runtime_dependency 'aws-sdk'
  s.add_development_dependency 'rspec'
end
