module Odf::Element
  class Heading < Abstract

    include AbstractContenteable

    XML_TAG = 'text:h'.freeze

    def self.build(parent, text, options = {})
      new(parent, text, options)
    end

    def initialize(parent, content, options = {})
      options = { level: 1 }.merge(options)
      super(parent, content, options)
    end

  end
end
