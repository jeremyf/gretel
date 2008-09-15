require 'rubygems'
require 'rake/gempackagetask'
eval(File.read(File.dirname(__FILE__) + '/rails-breadcrumb-trail.gemspec'))

Rake::GemPackageTask.new(GEM_SPECIFICATION) do |pkg|
  pkg.gem_spec = GEM_SPECIFICATION
end

task :install => [:package] do
  sh %{sudo gem install pkg/#{GEM}-#{VERSION}}
end