module Odf::Component
  class ImageSet < Abstract
    class Image

      attr_reader :uri, :path, :content_type

      def initialize(uri)
        @uri   = uri
        digest = OpenSSL::Digest::MD5.hexdigest(uri)
        @path = "Pictures/#{digest}"
      end

      def save
        @content, @content_type = Odf::Utils::File.fetch_image(self)
      end

      def content
        @content || (save && @content)
      end
    end

    attr_reader :images

    def initialize(*args)
      super
      @images = Set.new
    end

    def <<(path)
      image = Image.new(path)
      images << image
      image.path
    end

    def each(&block)
      images.each do |image|
        block.call(image)
      end
    end

  end
end
