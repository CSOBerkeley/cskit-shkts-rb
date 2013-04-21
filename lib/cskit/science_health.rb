# encoding: UTF-8

require 'cskit'

CSKit.register_book({
  :type => :science_health,
  :id => :science_health,
  :name => "Science and Health with Key to the Scriptures",
  :author => "Mary Baker Eddy",
  :language => "English",
  :resource_path => File.expand_path(File.join(File.dirname(__FILE__), "../../resources/science_health")),
  :parser => CSKit::Parsers::ScienceHealthParser,
  :reader => CSKit::Readers::ScienceHealthReader
})