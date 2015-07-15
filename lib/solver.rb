require './lib/board'
require './lib/spot'

class Solver
  attr_reader :board
  attr_accessor :current_spot

  def initialize(input)
    @board = Board.new(input).board
    @current_spot = board[0][0]
  end

  def solve
    if current_spot.value != 0
      @current_spot = board.next_spot(current_spot)
    end
    taken_row_values = row_values(current_spot.row)
    taken_column_values = column_values(current_spot.column)
    @current_spot.possibilities -= taken_row_values

    if current_spot.possibilities.size == 1
      set_spot_value
    end
    board
  end

  def row_values(row)
    board[row].map do |spot|
      spot.value unless spot.value == 0
    end

  end

  def column_values(column)
    transposed = board.transpose

    board[column].map do |spot|
      spot.value unless spot.value == 0
    end
  end

  def set_spot_value
      @current_spot.value = current_spot.possibilities[0]
  end

end

