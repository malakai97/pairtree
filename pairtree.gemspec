Gem::Specification.new do |s|
  deprecation_warning = <<~EOT
    rpairtree is deprecated; please use pairtree instead, which is now being
    maintained.  rpairtree 0.3.0 and pairtree 0.3.0 are identical. There will be no
    further releases of rpairtree.
  EOT

  s.name = "rpairtree"
  s.summary = "Ruby Pairtree implementation"
  s.description = deprecation_warning
  s.post_install_message = deprecation_warning
  s.version = "0.3.0"
  s.homepage = "http://github.com/mlibrary/pairtree"
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
