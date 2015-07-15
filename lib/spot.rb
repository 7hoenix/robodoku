class Spot
  attr_accessor :value, :possibilities
  attr_reader :row, :column

  def initialize(value, row, column)
    @value = value
    @row = row
    @column = column
    if value == 0
      @possibilities = [1,2,3,4,5,6,7,8,9]
    else
      @possibilities = [value]
    end
  end
end
