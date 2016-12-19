# Holds the xml of content.xml file
module Odf::Component
  class Content < Abstract
    include XmlComponent

    NAME = 'content.xml'.freeze

    attr_reader :root

    private
      def initialize_xml
        super
        xml.root = xml.create_element(
          'office:document-content',
          {
            'xmlns:office'    => 'urn:oasis:names:tc:opendocument:xmlns:office:1.0',
            'xmlns:style'     => 'urn:oasis:names:tc:opendocument:xmlns:style:1.0',
            'xmlns:text'      => 'urn:oasis:names:tc:opendocument:xmlns:text:1.0',
            'xmlns:table'     => 'urn:oasis:names:tc:opendocument:xmlns:table:1.0',
            'xmlns:draw'      => 'urn:oasis:names:tc:opendocument:xmlns:drawing:1.0',
            'xmlns:fo'        => 'urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0',
            'xmlns:xlink'     => 'http://www.w3.org/1999/xlink',
            'xmlns:dc'        => 'http://purl.org/dc/elements/1.1/',
            'xmlns:meta'      => 'urn:oasis:names:tc:opendocument:xmlns:meta:1.0',
            'xmlns:number'    => 'urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0',
            'xmlns:svg'       => 'urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0'
          }
        )
        body = xml.create_element('office:body')
        @root = body.add_child(xml.create_element(document.wrapper))
        xml.root.add_child(body)
      end

  end
end
