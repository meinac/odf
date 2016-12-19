require "spec_helper"

describe Odf do
  it "odt" do
    document = Odf::Document::Text.new
    document.add_heading('Tülaaay', { style: 'Heading_20_1' })
    document.add_paragraph('Ne olursun geri dön.')
    document.creator = 'Twentify'
    document.serialize("/Users/meinac/Work/ruby/twentify/src/odf/doc/text")
  end

  it "ods" do
    document = Odf::Document::Spreadsheet.new
    table    = document.add_table(table_name: 'Test Table')
    row      = table.add_table_row
    10.times do |i|
      row.add_cell("#{i}. Column")
    end
    300.times do |i|
      row = table.add_table_row
      10.times do |j|
        row.add_cell((i + 1) * (j + 1))
      end
    end
    document.serialize("/Users/meinac/Work/ruby/twentify/src/odf/doc/sheet")
  end

  it "odp" do
    Odf.styles = 'doc/aa/styles.xml'
    document = Odf::Document::Presentation.new
    page     = document.add_page
    frame    = page.add_frame(x: '3cm', y: '2cm', height: '2cm', width: '10cm')
    text_box = frame.add_text_box
    text_box.add_paragraph('Selamın aleyküm')
    frame    = page.add_frame(x: '3cm', y: '4.1cm', height: '2cm', width: '10cm')
    text_box = frame.add_text_box
    text_box.add_paragraph('Nasılsınız arkadaşlar')
    frame    = page.add_frame(x: '3cm', y: '6.2cm', height: '10cm', width: '10cm')
    frame.add_image({ href: 'http://api.twentify.com/public/logo_n.png' })
    frame    = page.add_frame(x: '3cm', y: '16.3cm', height: '10cm', width: '10cm')
    frame.add_image({ href: '/Users/meinac/Desktop/xd.gif' })

    page_2     = document.add_page
    frame_2    = page_2.add_frame(x: '3cm', y: '2cm', height: '20cm', width: '20cm')
    text_box_2 = frame_2.add_text_box
    list       = text_box_2.add_text_list
    item       = list.add_list_item
    item.add_paragraph('Selam')
    item       = list.add_list_item
    item.add_paragraph('Nasılsınız?')
    item       = list.add_list_item
    item.add_paragraph('İyidir sen nasılsın?')
    item       = list.add_list_item
    item.add_paragraph('Şizofren misin olum sen?')
    item       = list.add_list_item
    item.add_paragraph('Yooo. Sen?')
    item       = list.add_list_item
    list_2     = item.add_text_list
    item       = list_2.add_list_item
    item.add_paragraph('Foo')
    item       = list_2.add_list_item
    item.add_paragraph('Bar')
    document.serialize("/Users/meinac/Work/ruby/twentify/src/odf/doc/presentation")
  end
end
