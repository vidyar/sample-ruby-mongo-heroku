require 'ci/reporter/rake/rspec' 
require 'rspec/core/rake_task'
require 'mongoid'
require './bowling'

namespace :db do
  task :migrate => :environment do
    scores = Score.collection
    scores.drop
  end

  task :environment do
    Mongoid.load!('mongoid.yml', :production)
  end
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ['--format', 'RspecJunitFormatter', '--out', ENV['CI_REPORTS']]
end

task :default => [:spec]
