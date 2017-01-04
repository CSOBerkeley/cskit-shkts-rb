# encoding: UTF-8

require 'cskit'
require 'pathname'

module CSKit
  module ScienceHealth
    autoload :Splitter, 'cskit/science_health/splitter'
    autoload :Volume,   'cskit/science_health/volume'

    class << self
      def resource_dir
        @resource_dir ||= resource_pathname.to_s
      end

      def resource_root
        @resource_root ||= resource_pathname.join('science_health').to_s
      end

      private

      def resource_pathname
        @resource_dir ||= Pathname(__FILE__)
          .dirname.dirname.dirname
          .join('resources')
      end
    end
  end
end

CSKit.register_volume({
  type: :science_health,
  id: :science_health,
  name: 'Science and Health with Key to the Scriptures',
  author: 'Mary Baker Eddy',
  language: 'English',
  resource_path: CSKit::ScienceHealth.resource_root,
  volume: CSKit::ScienceHealth::Volume,
  parser: CSKit::Parsers::ScienceHealth::ScienceHealthParser,
  reader: CSKit::Readers::ScienceHealthReader
})
