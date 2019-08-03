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
# I change the distance to equal 3 and then to 1 and got the same results. Later I decided to add it after I called the method below. 
  def blur(distance=1)
    distance.times do
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
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1]
])
# placed the distance here instead of in def blur(distance=3) results are the same Manhattan distance of 3
image.blur(3)
image.output_image