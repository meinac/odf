module Odf::Element
  class TableRow < Abstract

    VALID_OPTIONS = {}
    XML_TAG = 'table:table-row'.freeze

    def self.build(parent, options = {})
      new(parent, options)
    end

    def add_cell(content, options = {})
      Odf::Element::TableCell.build(self, content, options)
    end

  end
end
