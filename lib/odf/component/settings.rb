module Odf::Component
  class Settings < Abstract
    include XmlComponent

    NAME = 'settings.xml'.freeze

    private
      def initialize_xml
        super
        xml.root = xml.create_element('office:document-settings', 'xmlns:office' => 'urn:oasis:names:tc:opendocument:xmlns:office:1.0')
        xml.add_element('office:settings')
      end

  end
end
