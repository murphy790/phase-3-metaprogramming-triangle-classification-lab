class Triangle
  attr_reader :x, :y, :z
  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  def kind
    triangle_validation
    if x == y && y == z
      :equilateral
    elsif x == y || y == z || x == z
      :isosceles
    else
      :scalene
    end
  end

  def triangle_validation
    real_triangle = [(x + y > z), (x + z > y), (y + z > x)]
    [x, y, z].each { |s| real_triangle << false if s <= 0 }
    raise TriangleError if real_triangle.include?(false)
  end

  class TriangleError < StandardError
    def message
      "invalid triangle"
    end
  end


end