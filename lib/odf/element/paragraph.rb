module Odf::Element
  class Paragraph < Abstract

    include AbstractContenteable

    VALID_OPTIONS = {}
    XML_TAG = 'text:p'.freeze

    def self.build(parent, text, options = {})
      new(parent, text, options)
    end

  end
end
