module Odf::Element
  class BinaryData < Abstract

    include AbstractContenteable

    XML_TAG = 'office:binary-data'.freeze

    def self.build(parent, content, options = {})
      new(parent, content, options)
    end

  end
end
