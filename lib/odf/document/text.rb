module Odf::Document
  class Text < Abstract

    MIME_TYPE = 'application/vnd.oasis.opendocument.text'.freeze
    EXTENSION = 'odt'.freeze
    WRAPPER   = 'office:text'.freeze

    def add_heading(text, options = {})
      Odf::Element::Heading.build(self, text, options)
    end

    def add_paragraph(text, options = {})
      Odf::Element::Paragraph.build(self, text, options)
    end

  end
end
