# encoding: UTF-8

# Copyright 2012 Twitter, Inc
# http://www.apache.org/licenses/LICENSE-2.0

require 'rubygems' unless ENV['NO_RUBYGEMS']

require 'bundler'
require 'digest'

require 'rubygems/package_task'

Bundler::GemHelper.install_tasks

task :update do
  require 'cskit'
  require 'cskit-shkts/science_health_splitter'

  input_file = File.join(File.dirname(__FILE__), "vendor/shkts.txt")
  output_dir = File.join(File.dirname(__FILE__), "resources/science_health")
  splitter = CSKit::Splitters::ScienceHealthSplitter.new(input_file)

  FileUtils.mkdir_p(output_dir)

  splitter.each_page do |page|
    File.open(File.join(output_dir, "#{page.number}.json"), "w+") do |f|
      puts "Writing #{page.number}.json ..."
      f.write(page.to_hash.to_json)
    end
  end
end
