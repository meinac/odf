module Odf::Component
  class Manifest < Abstract
    include XmlComponent

    NAME = 'META-INF/manifest.xml'.freeze

    private
      def initialize_xml
        super
        xml.root = xml.create_element('manifest:manifest', 'xmlns:manifest' => 'urn:oasis:names:tc:opendocument:xmlns:manifest:1.0')
        self_element = xml.create_element('manifest:file-entry', 'manifest:media-type' => document.media_type, 'manifest:full-path' => '/')
        xml.root.add_child(self_element)
        content_element = xml.create_element('manifest:file-entry', 'manifest:media-type' => 'text/xml', 'manifest:full-path' => 'content.xml')
        xml.root.add_child(content_element)
        styles_xml = xml.create_element('manifest:file-entry', 'manifest:media-type' => 'text/xml', 'manifest:full-path' => 'styles.xml')
        xml.root.add_child(styles_xml)
        settings_xml = xml.create_element('manifest:file-entry', 'manifest:media-type' => 'text/xml', 'manifest:full-path' => 'settings.xml')
        xml.root.add_child(settings_xml)
        meta_xml = xml.create_element('manifest:file-entry', 'manifest:media-type' => 'text/xml', 'manifest:full-path' => 'meta.xml')
        xml.root.add_child(meta_xml)
      end

      # Finalize XML
      def wrap_xml
        # Insert document images
        document.image_set.images.each do |image|
          image_element = xml.create_element('manifest:file-entry', 'manifest:media-type' => image.content_type, 'manifest:full-path' => image.path)
          xml.root.add_child(image_element)
        end
      end

  end
end
