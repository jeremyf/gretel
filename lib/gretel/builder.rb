module Gretel
  
  def self.new(*args)
    Builder.new(*args)
  end
  
  # The BreadcrumbTrail is responsible for building a breadcrumb.  This
  # class specializes in extracting paths from the nested URLs.
  #
  # The heavy lifting of extracting an object is delegated to the ModelExtractor.
  #
  class Builder
    extend Forwardable
    def_delegator :model_extractor, :extract_from_path, :extract_model_from_path
    attr_reader :request_path, :separator, :dom_id

    def initialize(request_path = nil, options = {})

      @request_path = request_path
      @separator = options[:separator] || '&raquo;'
      @dom_id = options[:dom_id] || 'breadcrumb_trail'
    end

    def to_s
      levels = request_path.split('?')[0].split('/')
      levels.delete_at(0)

      links = "<a href='/'>home</a>"

      levels.each_with_index do |level, index|
        text, href = extract_text_and_href(level, levels[0..index])
        links += %( #{separator} <a href="#{href}">#{text.to_s.downcase}</a>)
      end

      %(
      <div id="#{dom_id}">
      <p>#{links}</p>
      </div>
      )
    end

    protected
    def extract_text_and_href(text, href_elements)
      path = File.join("/", href_elements.join('/'))
      return [extract_model_from_path(path) || text.downcase.gsub('_', ' '), path]
    end

    def model_extractor
      ModelExtractor
    end
  end
end
