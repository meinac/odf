module Odf::Component
  module XmlComponent

    def self.included(base)
      base.class_eval { attr_reader :xml }
    end

    def initialize(document)
      super
      initialize_xml
    end

    def content
      wrap_xml
      xml.to_xml
    end

    private
      def initialize_xml
        @xml = Odf::Utils::Xml.new
        xml.encoding = "UTF-8"
      end

      def wrap_xml
        true
      end

  end
end