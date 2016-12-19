module Odf::Document
  class Spreadsheet < Abstract

    MIME_TYPE = 'application/vnd.oasis.opendocument.spreadsheet'.freeze
    EXTENSION = 'ods'.freeze
    WRAPPER   = 'office:spreadsheet'.freeze

    def add_table(options = {})
      Odf::Element::Table.build(self, options)
    end

  end
end
