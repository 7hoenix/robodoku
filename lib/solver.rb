require './lib/board'
require './lib/spot'

class Solver
  attr_accessor :current_spot, :board, :my_board

  def initialize(input)
    @my_board = Board.new(input)
    @board = my_board.board
    @current_spot = board[0][0]
  end

  def solve
    changed_something = false
    until found_solution
      if current_spot_solved?
        set_spot_value
        changed_something = false
        @current_spot = my_board.next_spot(current_spot)
      elsif changed_something
        @current_spot = my_board.next_spot(current_spot)
        changed_something = false
      else
          eliminate_possibilities
          changed_something = true
      end
    end
    board
  end

  def eliminate_possibilities
      possible_count = current_spot.possibilities.count
      not_possibles = row_values(current_spot.row)
      not_possibles += column_values(current_spot.column)
      not_possibles += square_values(current_spot.square)
      @current_spot.possibilities -= not_possibles
  end

  def current_spot_solved?
     true if current_spot.possibilities.size == 1
  end

  def found_solution
    values = []
    board.flat_map do |row|
      row.map { |spot| values << spot.value }
    end
    values.all? { |value| value != 0 }
  end

  def row_values(row)
    board[row].map do |spot|
      spot.value unless spot.value == 0
    end
  end

  def column_values(column)
    row = 0
    values = []
    while row <= 8
      values << board[row][column].value unless board[row][column].value == 0
      row += 1
    end
    values
  end

  def square_values(square)
    row = 0
    column = 0
    values = []
    while row <= 8
      while column <= 8

        if spot(row, column).square == square
          values << spot(row, column).value unless spot(row, column).value == 0
        end
        column += 1
      end
      column = 0
      row += 1
    end
    values
  end

  def spot(row, column)
    board[row][column]
  end

  def set_spot_value
    @current_spot.value = current_spot.possibilities[0]
  end

end
