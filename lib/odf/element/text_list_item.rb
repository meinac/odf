module Odf::Element
  class TextListItem < Abstract

    VALID_OPTIONS = {
      start_value: 'text:start-value',
      style_override: 'text:style-override',
      style_name: 'text:style-name'
    }

    XML_TAG = 'text:list-item'.freeze

    def self.build(parent, options = {})
      new(parent, options)
    end

    def add_heading(text, options = {})
      Odf::Element::Heading.build(self, text, options)
    end

    def add_paragraph(text, options = {})
      Odf::Element::Paragraph.build(self, text, options)
    end

    def add_text_list(options = {})
      Odf::Element::TextList.build(self, options)
    end

  end
end
