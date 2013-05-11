# encoding: UTF-8

require 'json'

module CSKitShkts
  class Volume < CSKit::Volume

    def get_page(page_number)
      resource_file = File.join(resource_path, "#{page_number}.json")
      page_cache[page_number] ||= CSKit::Volumes::ScienceHealth::Page.from_hash(JSON.parse(File.read(resource_file)))
    end

    protected

    def page_cache
      @page_cache ||= {}
    end

  end
end