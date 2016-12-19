module Odf::Document
  class Abstract

    COMPONENTS = [:content, :manifest, :meta, :mime_type, :styles, :settings]

    attr_reader *(COMPONENTS + [:image_set])
    attr_writer :creator

    alias :document :itself

    def initialize
      @content   = Odf::Component::Content.new(self)
      @image_set = Odf::Component::ImageSet.new(self)
      @manifest  = Odf::Component::Manifest.new(self)
      @meta      = Odf::Component::Meta.new(self)
      @mime_type = Odf::Component::MimeType.new(self)
      @settings  = Odf::Component::Settings.new(self)
      @styles    = Odf::Component::Styles.new(self)
    end

    # Returns the mime type of document.
    # All subclasses of this abstract class
    # should define the +MIME_TYPE+ constant.
    def media_type
      self.class::MIME_TYPE
    end

    # Returns the file extension for
    # open document format.
    def extension
      self.class::EXTENSION
    end

    def wrapper
      self.class::WRAPPER
    end

    # Returns the components of the document.
    def components
      COMPONENTS
    end

    # Returns the creator information.
    def creator
      @creator || Odf.creator
    end

    # Serialize the document to given path.
    def serialize(file_name)
      Odf::Utils::File.serialize(file_name, self) && true
    end

    # Returns the output stream.
    def to_blob
      Odf::Utils::File.output_stream(self)
    end

    def add_image(uri)
      image_set << uri
    end

    def root
      content.root
    end

  end
end
