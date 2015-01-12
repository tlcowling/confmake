Gem::Specification.new do |s|
  s.name        = 'confmake'
  s.version     = '0.1.1'
  s.licenses    = ['APACHE2']
  s.summary     = "Command line tool to create configuration files"
  s.description = "Create configuration files from templates using environment variables or property lists.  Save as text, yaml and json"
  s.authors     = ["Tom Cowling"]
  s.email       = 'tom.cowling@gmail.com'
  s.homepage    = 'https://www.tlcowling.com/gems/confmake'
  s.add_runtime_dependency 'clamp'
  s.add_runtime_dependency 'thor'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
