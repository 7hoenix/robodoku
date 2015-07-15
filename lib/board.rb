require_relative '../lib/spot'

class Board
  attr_reader :board
  def initialize(input)
    @board = [[],[],[],[],[],[],[],[],[]]
    fill_board(input)
  end

  def fill_board(input)
    row, column = 0, 0
    while row <= 8
      while column <= 8
        @board[row][column] = Spot.new(input[row][column], row, column)
        column += 1
      end
      column = 0
      row += 1
    end
  end

  def next_spot(current_spot)
      check_row = current_spot.row
      check_column = current_spot.column

    until current_spot.value == 0 || check_row > 8
        spot = get_spot(check_row, check_column)
      if spot.column < 8
        return current_spot = spot if spot.value == 0
        check_column += 1
      else
        return current_spot = spot if spot.value == 0
        check_column = 0
        check_row += 1
      end
    end
  end

  def get_spot(row, column)
    board[row][column]
  end
end
