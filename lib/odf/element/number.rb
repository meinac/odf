module Odf::Element
  class Number < Abstract

    include AbstractContenteable

    VALID_OPTIONS = {}
    XML_TAG = 'text:number'.freeze

    def self.build(parent, text, options)
      new(parent, text, options)
    end

  end
end
