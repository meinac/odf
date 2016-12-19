module Odf::Component
  class Styles < Abstract
    include XmlComponent

    NAME = 'styles.xml'.freeze

    def content
      Odf.styles
    end

    private
      def initialize_xml
        super
        xml.root = xml.create_element('office:document-styles', 'xmlns:office' => 'urn:oasis:names:tc:opendocument:xmlns:office:1.0')
        font_decls = xml.create_element('office:font-face-decls')
        times_nr   = xml.create_element('style:font-face', { 'style:name' => 'Times New Roman', 'svg:font-family' => '&apos;Times New Roman&apos;', 'style:font-family-generic' => 'roman', 'style:font-pitch' => 'variable' })
        arial      = xml.create_element('style:font-face', { 'style:name' => 'Arial', 'svg:font-family' => '&apos;Arial&apos;', 'style:font-family-generic' => 'swiss', 'style:font-pitch' => 'variable' })
        arial_uc   = xml.create_element('style:font-face', { 'style:name' => 'Arial Unicode MS', 'svg:font-family' => '&apos;Arial Unicode MS&apos;', 'style:font-family-generic' => 'system', 'style:font-pitch' => 'variable' })
        font_decls.add_child(times_nr)
        font_decls.add_child(arial)
        font_decls.add_child(arial_uc)
        xml.root.add_child(font_decls)
      end

  end
end
