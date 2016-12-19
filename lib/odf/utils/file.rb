module Odf::Utils
  class File

    class << self
      def serialize(name, document)
        Zip::File.open("#{name}.#{document.extension}", Zip::File::CREATE) do |zipfile|
          # Resolve images
          document.image_set.each do |image|
            zipfile.get_output_stream(image.path) { |stream| stream.write(image.content) }
          end

          document.components.each do |component_name|
            component = document.send(component_name)
            zipfile.get_output_stream(component.name) { |stream| stream.write(component.content) }
          end
        end
      end

      def output_stream(document)
        Zip::OutputStream.write_buffer do |io|
          document.image_set.each do |image|
            io.put_next_entry(image.path)
            io.write(image.content)
          end

          document.components.each do |component_name|
            component = document.send(component_name)
            io.put_next_entry(component.name)
            io.write(component.content)
          end
        end
      end

      def fetch_image(image)
        io           = open(image.uri)
        content      = io.read
        content_type = MimeMagic.by_magic(io).type
        [content, content_type]
      ensure
        io.close
      end

    end
  end
end
