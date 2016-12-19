module Odf::Element
  class Abstract

    attr_reader :parent, :root

    def initialize(parent, options = {})
      @parent = parent
      @root   = document.content.xml.create_element(xml_tag, fetch_options(options))
      @parent.root.add_child(@root)
    end

    # Accessor for valid options of element
    def valid_options
      @valid_options ||= defined?(self.class::VALID_OPTIONS) ? self.class::VALID_OPTIONS : {}
    end

    def xml_tag
      self.class::XML_TAG
    end

    def document
      parent.document
    end

    private
      def fetch_options(options)
        options.reduce({}) do |ret, (k, v)|
          option = valid_options.fetch(k, k)
          ret.merge(option => v)
        end
      end

  end
end
