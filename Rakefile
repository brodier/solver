#!/usr/bin/env rake
require "bundler/gem_tasks"
 
require 'rake/testtask'
 
desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -r solver.rb"
end
 
 
Rake::TestTask.new do |t|
  t.libs << 'lib/solver'
  t.test_files = FileList['test/lib/solver/*_test.rb']
  t.verbose = true
end
 
task :default => :test
