class Image
        attr_accessor :image

        def initialize (image)
             @image = image
        end

        def output_image
            @image.each do |row|
              puts row.join
        end
  end 
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image