module Odf::Component
  class Abstract

    attr_reader :document

    def initialize(document)
      @document = document
    end

    def content
      raise NotImplementedError.new('Subclasess should implement this method!')
    end

    def name
      self.class::NAME
    end

    def inspect
      to_s
    end

  end
end
