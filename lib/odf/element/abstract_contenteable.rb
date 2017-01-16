# Contenteable elements contain content,
# e.g. table cell contains numbers.
module Odf::Element
  module AbstractContenteable

    # Override the Odf::Element::Abstract to accept content.
    def initialize(parent, content, options = {})
      @parent = parent
      @root   = document.content.xml.create_element(xml_tag, content, fetch_options(options))
      @parent.add_child(@root)
    end

  end
end
