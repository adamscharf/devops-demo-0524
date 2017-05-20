require 'foodcritic'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

# Style tests
namespace :style do
  desc 'Run Ruby style checks'
  RuboCop::RakeTask.new(:rubocop)

  desc 'Run Chef style checks'
  FoodCritic::Rake::LintTask.new(:foodcritic) do |t|
    t.options = {
      fail_tags: ['any']
    }
  end
end

desc 'Run all style checks'
task style: ['style:rubocop', 'style:foodcritic']

# Unit tests
namespace :spec do
  desc 'Run spec tests'
  RSpec::Core::RakeTask.new(:spec)
end

desc 'Run all unit tests'
task spec: ['spec:spec']

# Default
task default: %w[style spec]
