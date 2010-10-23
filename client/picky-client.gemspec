Gem::Specification.new do |s|
  s.name = 'picky-client'
  s.version = '0.2.4'
  s.author = 'Florian Hanke'
  s.email = 'florian.hanke+picky-client@gmail.com'
  s.homepage = 'http://floere.github.com/picky'
  s.platform = Gem::Platform::RUBY
  s.summary = 'picky Search Engine Client'
  s.files = Dir["lib/**/*.rb"]
  s.test_files = Dir["spec/**/*_spec.rb"]
  s.has_rdoc = false
  s.extra_rdoc_files = ['README.rdoc']
  
  s.add_dependency('yajl-ruby', '>= 0.7.8')
end