module Odf::Document
  class Presentation < Abstract

    MIME_TYPE = 'application/vnd.oasis.opendocument.presentation'.freeze
    EXTENSION = 'odp'.freeze
    WRAPPER   = 'office:presentation'.freeze

    def add_page(options = {})
      Odf::Element::DrawPage.build(self, options)
    end

  end
end
