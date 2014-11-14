Gem::Specification.new do |s|
  s.name        = 'confswap'
  s.version     = '0.0.1'
  s.licenses    = ['MIT']
  s.summary     = "Confswap swaps conf variables!"
  s.description = "Create a configuration from a template using environment variables"
  s.authors     = ["Tom Cowling"]
  s.email       = 'tom.cowling@gmail.com'
  s.homepage    = 'https://www.tlcowling.com/gems/confswap'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

