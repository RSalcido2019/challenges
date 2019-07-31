class Image
  attr_accessor :image

  def initialize(image)
    @image = image
  end

  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  def blur(range=1)
    range.times do
      transformer
    end
  end

  private

    def transformer
      transformer = []
      @image.each_with_index do |row, i|
        row.each_with_index do |x, row_i|
          transformer << [i, row_i] if x == 1
        end
      end

      transformer.each do |transform|
        @image[transform[0]][transform[1] + 1] = 1 if transform[1] + 1 <= @image[transform[0]].length - 1
        @image[transform[0]][transform[1] - 1] = 1 if transform[1] - 1 >= 0
        @image[transform[0] + 1][transform[1]] = 1 if transform[0] + 1 <= @image.length - 1
        @image[transform[0] - 1][transform[1]] = 1 if transform[0] - 1 >= 0
      end
    end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.blur()
image.output_image