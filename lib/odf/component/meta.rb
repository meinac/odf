module Odf::Component
  class Meta < Abstract
    include XmlComponent

    TIME_FORMAT = '%Y-%m-%dT%H:%M:%S'.freeze
    NAME = 'meta.xml'.freeze

    private
      def wrap_xml
        xml.root = xml.create_element(
          'office:document-meta',
          {
            'xmlns:office' => 'urn:oasis:names:tc:opendocument:xmlns:office:1.0',
            'xmlns:dc'     => 'http://purl.org/dc/elements/1.1/',
            'xmlns:meta'   => 'urn:oasis:names:tc:opendocument:xmlns:meta:1.0'
          }
        )
        meta_element = xml.add_element('office:meta')
        xml.add_element_into(meta_element, 'meta:generator', 'Ruby-ODF-Gem')
        xml.add_element_into(meta_element, 'dc:creator', document.creator) if document.creator
        xml.add_element_into(meta_element, 'meta:creation-date', Time.now.strftime(TIME_FORMAT))
      end

  end
end
