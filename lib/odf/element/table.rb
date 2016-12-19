module Odf::Element
  class Table < Abstract

    VALID_OPTIONS = {
      table_name: 'table:name'
    }

    XML_TAG = 'table:table'.freeze

    def self.build(parent, options = {})
      new(parent, options)
    end

    def add_table_row(options = {})
      Odf::Element::TableRow.build(self, options)
    end

  end
end
