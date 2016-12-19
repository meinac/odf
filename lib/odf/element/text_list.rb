module Odf::Element
  class TextList < Abstract

    VALID_OPTIONS = {
      continue_list: 'text:continue-list',
      continue_numbering: 'text:continue-numbering',
      style_name: 'text:style-name'
    }

    XML_TAG = 'text:list'.freeze

    def self.build(parent, options = {})
      new(parent, options)
    end

    def add_list_item(options = {})
      Odf::Element::TextListItem.build(self, options)
    end

  end
end
