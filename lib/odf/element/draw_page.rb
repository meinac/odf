module Odf::Element
  class DrawPage < Abstract

    XML_TAG = 'draw:page'.freeze

    def self.build(document, options = {})
      new(document, options)
    end

    def add_frame(options = {})
      Odf::Element::DrawFrame.build(self, options)
    end

  end
end
