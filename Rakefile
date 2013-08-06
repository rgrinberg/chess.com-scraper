require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib/chess_com'
  t.test_files = FileList['test/lib/*.rb']
  t.verbose = true
end
 
task :default => :test
