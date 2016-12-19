module Odf::Element
  module AbstractContenteable

    def initialize(parent, content, options = {})
      @parent = parent
      @root   = document.content.xml.create_element(xml_tag, content, fetch_options(options))
      @parent.root.add_child(@root)
    end

  end
end
