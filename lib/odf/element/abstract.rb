# Abstract elements do not contain content,
# they contain only other elements.
module Odf::Element
  class Abstract

    # +root+ stands for the root xml element.
    # +parent+ stands for the parent odf element.
    attr_reader :parent, :root

    def initialize(parent, options = {})
      @parent = parent
      @root   = document.content.xml.create_element(xml_tag, fetch_options(options))
      @parent.add_child(@root)
    end

    # Accessor for valid options of element.
    def valid_options
      @valid_options ||= defined?(self.class::VALID_OPTIONS) ? self.class::VALID_OPTIONS : {}
    end

    def xml_tag
      self.class::XML_TAG
    end

    # Delegates the `document` method of the parent.
    # This document object is crucial for creating xml elements.
    def document
      parent.document
    end

    # Delegates the `add_child` method of the root.
    def add_child(element)
      root.add_child(element)
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
