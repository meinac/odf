module Odf::Component
  class MimeType < Abstract

    NAME = 'mimetype'.freeze

    def content
      document.media_type
    end

  end
end
