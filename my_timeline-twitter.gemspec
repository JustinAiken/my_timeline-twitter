$:.push File.expand_path("../lib", __FILE__)

require "my_timeline/twitter/version"

Gem::Specification.new do |s|
  s.name        = "my_timeline-twitter"
  s.version     = MyTimeline::Twitter::VERSION
  s.authors     = ["Justin Aiken"]
  s.email       = ["60tonangel@gmail.com"]
  s.homepage    = "https://www.github.com/JustinAiken/my_timeline-twitter"
  s.summary     = "Twitter plugin for MyTimeline"
  s.description = "Twitter plugin for MyTimeline"
  s.license     = 'MIT'
  s.files       = `git ls-files`.split("\n")

  s.add_runtime_dependency "my_timeline", '>= 0.0.4'
  s.add_runtime_dependency "twitter", ['>= 5.0', '< 6.0']
end
