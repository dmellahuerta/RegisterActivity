$:.push File.expand_path('lib', __dir__)

Gem::Specification.new do |spec|
  spec.name = 'register_activity'
  spec.authors = ['Daniel Mella Huerta']
  spec.version = '0.0.0'
  spec.date = '2012-07-19'
  spec.summary = 'register_activity is the best'
  spec.files = [
    'lib/register_activity.rb'
  ]

  spec.add_development_dependency 'active_resource-dirty', '~> 1.0.4'
  spec.add_development_dependency 'activerecord', '~> 5.2.3'
  spec.add_development_dependency 'activeresource', '~> 5.1.0'
  spec.add_development_dependency 'rspec-rails', '~> 3.8'
end
