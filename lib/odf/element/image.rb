module Odf::Element
  class Image < Abstract

    VALID_OPTIONS = {
      filter_name: 'draw:filter-name',
      actuate:     'xlink:actuate',
      href:        'xlink:href',
      show:        'xlink:show',
      type:        'xlink:type',
      xml_id:      'xml:id'
    }

    XML_TAG = 'draw:image'.freeze

    def self.build(parent, options = {})
      new(parent, options)
    end

    def initialize(parent, options)
      @parent = parent

      # Save image under Pictures directory
      if options.fetch(:save, true) && options[:href]
        uri = save_image(options[:href])
        options.merge!({ href: uri, show: 'embed' })
      end

      super(parent, options)
    end

    def add_paragraph(text, options = {})
      Odf::Element::Paragraph.build(self, text, options)
    end

    private
      def save_image(href)
        document.add_image(href)
      end

  end
end
