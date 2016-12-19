require 'open-uri'
require 'set'
require 'openssl'
require 'zip'
require 'nokogiri'
require 'mimemagic'

require 'odf/version'
require 'odf/utils/file'
require 'odf/utils/xml'

require 'odf/element/abstract'
require 'odf/element/abstract_contenteable'
require 'odf/element/binary_data'
require 'odf/element/draw_page'
require 'odf/element/draw_frame'
require 'odf/element/draw_text_box'
require 'odf/element/heading'
require 'odf/element/image'
require 'odf/element/number'
require 'odf/element/paragraph'
require 'odf/element/table'
require 'odf/element/table_cell'
require 'odf/element/table_row'
require 'odf/element/text_list'
require 'odf/element/text_list_item'

require 'odf/component/xml_component'
require 'odf/component/abstract'
require 'odf/component/content'
require 'odf/component/image_set'
require 'odf/component/manifest'
require 'odf/component/meta'
require 'odf/component/mime_type'
require 'odf/component/settings'
require 'odf/component/styles'

require 'odf/document/abstract'
require 'odf/document/presentation'
require 'odf/document/spreadsheet'
require 'odf/document/text'

module Odf

  ROOT_PATH = File.expand_path("../..", __FILE__)
  TEMPLATE_PATH = "#{ROOT_PATH}/templates".freeze
  DEFAULT_STYLE = "#{TEMPLATE_PATH}/default_style.xml".freeze

  def self.configure(&block)
    block.call
  end

  def self.styles=(val)
    @styles = val
  end

  def self.styles
    File.read(@styles || DEFAULT_STYLE)
  end

  def self.creator
    @creator
  end

end
