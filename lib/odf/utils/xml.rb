module Odf::Utils
  class Xml < Nokogiri::XML::Document

    def add_element(name, value = nil, **attributes)
      root.add_child(create_element(name, value, attributes))
    end

    def add_element_into(element, name, value = nil, **attributes)
      element.add_child(create_element(name, value, attributes))
    end

  end
end
