module Odf::Element
  class DrawTextBox < Abstract

    VALID_OPTIONS = {
      next_name:     'draw:chain-next-name',
      corner_radius: 'draw:corner-radius',
      max_height:    'fo:max-height',
      max_width:     'fo:max-width',
      min_height:    'fo:min-height',
      min_width:     'fo:min-width',
      text_id:       'text:id',
      xml_id:        'xml:id'
    }

    XML_TAG = 'draw:text-box'.freeze

    def self.build(parent, options = {})
      new(parent, options)
    end

    def add_frame(options = {}) 
      Odf::Element::DrawFrame.build(self, options)
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
