# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bijection/version"

Gem::Specification.new do |s|
  s.name        = "bijection"
  s.version     = Bijection::VERSION
  s.authors     = ["Ryan Berckmans"]
  s.email       = ["ryan.berckmans@gmail.com"]
  s.homepage    = "https://github.com/ryanberckmans/bijection"
  s.summary     = "bijection container in ruby; pre-alpha wip"
  s.description = s.summary

  s.rubyforge_project = "bijection"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
