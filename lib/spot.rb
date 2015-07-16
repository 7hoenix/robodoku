class Spot
  attr_accessor :value, :possibilities
  attr_reader :row, :column, :square

  def initialize(value, row, column)
    @value = value
    @row = row
    @column = column
    if row <= 2
      if column <= 2
        @square = 0
      elsif column <= 5 && column  > 2
        @square = 1
      else
        @square = 2
      end
    elsif row <= 5
      if column <= 2
        @square = 3
      elsif column <= 5 && column > 2
        @square = 4
      else
        @square = 5
      end
    else
      if column <= 2
        @square = 6
      elsif column <= 5 && column > 2
        @square = 7
      else
        @square = 8
      end
    end

    if value == 0
      @possibilities = [1,2,3,4,5,6,7,8,9]
    else
      @possibilities = [value]
    end
  end
end
