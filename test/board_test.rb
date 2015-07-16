require_relative '../lib/board'

class BoardTest < Minitest::Test

  def test_the_board_has_spots_in_it
    input = [[8,2,6,5,9,4,3,1,7],
      [7,1,5,6,3,8,9,4,2],
      [3,9,4,7,2,1,8,6,5],
      [1,6,3,4,5,9,2,7,8],
      [9,4,8,2,6,7,1,5,3],
      [2,5,7,8,1,3,6,9,4],
      [5,3,1,9,4,2,7,8,6],
      [4,8,2,1,7,6,5,3,9],
      [6,7,9,3,8,5,4,2,1]]
    my_board = Board.new(input)
    spot = my_board.board[1][2]
    assert_equal 5, spot.value
  end

  def test_it_finds_the_next_spot_that_doesnt_have_a_value
    input =  [[0,2,6,5,9,4,3,1,7],
              [7,1,5,6,3,8,9,4,2],
              [3,9,4,7,2,1,8,6,5],
              [1,6,3,4,5,9,2,7,8],
              [9,4,8,2,6,7,1,5,3],
              [2,5,7,8,1,3,6,9,4],
              [5,3,1,9,4,2,7,8,6],
              [4,8,2,1,7,6,5,3,9],
              [6,7,9,3,8,5,4,2,1]]
    my_board = Board.new(input)
    initial_spot = my_board.board[0][0]
    assert_equal 9, initial_spot.possibilities.count
  end


  def test_it_finds_the_next_spot_harder
    input =  [[8,0,6,5,9,4,3,1,7],
              [7,1,5,6,3,8,9,4,2],
              [3,9,4,7,2,1,8,6,5],
              [1,6,3,4,5,9,2,7,8],
              [9,4,8,2,6,7,1,5,3],
              [2,5,7,8,1,3,6,9,4],
              [5,3,1,9,4,2,7,8,6],
              [4,8,2,1,7,6,5,3,9],
              [6,7,9,3,8,5,4,2,1]]
    my_board = Board.new(input)
    initial_spot = my_board.board[0][0]
    next_spot = my_board.next_spot(initial_spot)
    assert_equal 9, next_spot.possibilities.count
  end

  def test_it_finds_the_next_spot_harder
    input =  [[8,2,6,5,9,4,3,1,0],
              [7,1,5,6,3,8,9,4,2],
              [3,9,4,7,2,1,8,6,5],
              [1,6,3,4,5,9,2,7,8],
              [9,4,8,2,6,7,1,5,3],
              [2,5,7,8,1,3,6,9,4],
              [5,3,1,9,4,2,7,8,6],
              [4,8,2,1,7,6,5,3,9],
              [6,7,9,3,8,5,4,2,1]]
    my_board = Board.new(input)
    initial_spot = my_board.board[0][0]
    next_spot = my_board.next_spot(initial_spot)

    assert_equal 8, next_spot.column
    assert_equal 0, next_spot.row
  end

  def test_it_finds_the_next_spot_much_harder
    input =  [[8,2,6,5,9,4,3,1,7],
              [7,1,5,6,3,8,9,4,2],
              [3,9,4,7,2,1,8,6,5],
              [1,6,3,4,5,9,2,7,8],
              [9,4,8,2,6,7,1,5,3],
              [2,5,7,8,1,3,6,9,4],
              [5,3,1,9,4,2,7,8,6],
              [4,8,2,1,7,6,5,3,9],
              [6,7,9,3,8,5,4,2,0]]
    my_board = Board.new(input)
    initial_spot = my_board.board[0][0]
    spot = my_board.next_spot(initial_spot)


    assert_equal 8, spot.column
    assert_equal 8, spot.row
  end

  def test_it_finds_the_next_spot_when_we_have_two_options
    input =  [[8,0,6,5,0,4,3,1,7],
              [7,1,5,6,3,8,9,4,2],
              [3,9,0,7,2,1,8,6,5],
              [1,6,3,4,5,9,2,7,8],
              [9,4,8,2,6,7,1,5,3],
              [2,5,7,8,1,3,6,9,4],
              [5,3,1,9,4,2,7,8,6],
              [4,8,2,1,7,6,5,3,9],
              [6,7,9,3,8,5,4,2,1]]
    my_board = Board.new(input)
    initial_spot = my_board.board[0][0]
    next_spot = my_board.next_spot(initial_spot)

    assert_equal 1, next_spot.column
    assert_equal 0, next_spot.row
  end
end
