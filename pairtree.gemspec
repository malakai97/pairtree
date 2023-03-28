Gem::Specification.new do |s|
  s.name = "pairtree"
  s.summary = "Ruby Pairtree implementation"
  s.version = "0.3.0"
  s.homepage = "http://github.com/ruby-microservices/pairtree"
  s.licenses = ["Apache2"]
  s.authors = ["Chris Beer, Bryan Hockey, Michael Slone, Aaron Elkiss"]
  s.files = `git ls-files`.split("\n")
  s.extra_rdoc_files = ["LICENSE.txt", "README.md"]
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler"
  s.add_development_dependency "rspec", ">= 3.12"
  s.add_development_dependency "yard"
  s.add_development_dependency "rake"
end
