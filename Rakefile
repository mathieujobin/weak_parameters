require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)
task default: :spec

task :rspec do
     system "rspec spec/requests/sinatra_spec.rb"
     system "rspec spec/requests/recipes_spec.rb"
end
