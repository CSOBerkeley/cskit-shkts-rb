# encoding: UTF-8

$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'cskit/science_health/version'

Gem::Specification.new do |s|
  s.name     = 'cskit-shkts'
  s.version  = ::CSKit::ScienceHealth::VERSION
  s.authors  = ['Cameron Dutro']
  s.email    = ['camertron@gmail.com']
  s.homepage = 'http://github.com/camertron'

  s.description = s.summary = 'Science and Health resources for CSKit.'

  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true

  s.add_dependency 'json'
  s.add_dependency 'cskit', '~> 1.1.0'

  s.require_path = 'lib'
  s.files = Dir["{lib,spec,resources}/**/*", 'Gemfile', 'History.txt', 'LICENSE', 'README.md', 'Rakefile', 'cskit-shkts.gemspec']
end
