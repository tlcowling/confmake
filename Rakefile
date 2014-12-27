begin
  require 'rubygems'
	require 'bundler/gem_tasks'
  require 'rspec/core/rake_task'
	require 'cucumber'
	require 'cucumber/rake/task'

	Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "features --format pretty"
	end

  RSpec::Core::RakeTask.new(:spec)

  task :bump do
  end

  task :build   => ['bump']
  task :default => ['spec']
  task :test    => ['spec','features']

rescue LoadError
end
