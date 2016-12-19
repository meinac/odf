module Odf::Element
  class DrawFrame < Abstract

    VALID_OPTIONS = {
      caption_id: 'draw:caption-id',
      class_names: 'draw:class-names',
      copy_of: 'draw:copy-of',
      id: 'draw:id',
      name: 'draw:name',
      style_name: 'draw:style-name',
      text_style_name: 'draw:text-style-name',
      transform: 'draw:transform',
      z_index: 'draw:z-index',
      p_class: 'presentation:class',
      p_class_names: 'presentation:class-names',
      placeholder: 'presentation:placeholder',
      p_style_name: 'presentation:style-name',
      user_transformed: 'presentation:user-transformed',
      rel_height: 'style:rel-height',
      rel_width: 'style:rel-width',
      height: 'svg:height',
      width: 'svg:width',
      x: 'svg:x',
      y: 'svg:y',
      end_cell_address: 'table:end-cell-address',
      end_x: 'table:end-x',
      end_y: 'table:end-y',
      table_background: 'table:table-background',
      anchor_page_number: 'table:anchor-page-number',
      anchor_type: 'table:anchor-type',
      xml_id: 'xml:id',
      layer: 'draw:layer'
    }

    XML_TAG = 'draw:frame'.freeze

    def self.build(parent, options = {})
      new(parent, options)
    end

    def add_text_box(options = {})
      Odf::Element::DrawTextBox.build(self, options)
    end

    def add_image(options = {})
      Odf::Element::Image.build(self, options)
    end

  end
end
