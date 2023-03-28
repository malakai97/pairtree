Gem::Specification.new do |s|
  s.name = "rpairtree"
  s.summary = "Ruby Pairtree implementation, forked from pairtree which is abandoned."
  s.version = "0.2.0"
  s.homepage = "http://github.com/mlibrary/pairtree"
  s.licenses = ["Apache2"]
  s.authors = ["Chris Beer, Bryan Hockey, Michael Slone"]
  s.files = `git ls-files`.split("\n")
  s.extra_rdoc_files = ["LICENSE.txt", "README.md"]
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler"
  s.add_development_dependency "rspec", ">= 2.0"
  s.add_development_dependency "yard"
  s.add_development_dependency "rake"
end
