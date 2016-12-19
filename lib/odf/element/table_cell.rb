module Odf::Element
  class TableCell < Abstract

    TYPE_MAP = {
      Fixnum => 'float',
      Float  => 'float',
      String => 'string'
    }

    VALID_OPTIONS = {}
    XML_TAG = 'table:table-cell'.freeze

    def self.build(parent, content, options = {})
      type      = options[:type] || infer_type(content)
      self_opts = {
          'office:value-type' => type,
          'office:value' => content
        }.merge(options)
      this = new(parent, self_opts)

      Odf::Element::Paragraph.build(this, content, options)
      this
    end

    def self.infer_type(content)
      TYPE_MAP[content.class] || 'string'
    end

  end
end
