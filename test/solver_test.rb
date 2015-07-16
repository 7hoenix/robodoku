require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/solver'

class SolverTest < Minitest::Test

  def test_it_can_solve_an_already_solved_sudoku
    skip
    input =  [[8,2,6,5,9,4,3,1,7],
              [7,1,5,6,3,8,9,4,2],
              [3,9,4,7,2,1,8,6,5],
              [1,6,3,4,5,9,2,7,8],
              [9,4,8,2,6,7,1,5,3],
              [2,5,7,8,1,3,6,9,4],
              [5,3,1,9,4,2,7,8,6],
              [4,8,2,1,7,6,5,3,9],
              [6,7,9,3,8,5,4,2,1]]
    solver = Solver.new(input)
    solution = solver.solve
    assert_equal 2, solution[7][2].value
  end

  def test_it_can_solve_a_trivial_sudoku
    skip
    input =  [[8,2,6,5,9,4,3,1,7],
              [7,1,5,6,3,8,9,4,2],
              [3,9,4,7,2,1,8,6,5],
              [1,6,3,4,5,9,2,7,8],
              [9,4,8,2,6,7,1,5,3],
              [2,5,7,8,1,3,6,9,4],
              [5,3,1,9,4,2,7,8,6],
              [4,8,0,1,7,6,5,3,9],
              [6,7,9,3,8,5,4,2,1]]
    solver = Solver.new(input)
    solution = solver.solve
    assert_equal 2, solution[7][2].value
  end

  def test_it_can_solve_a_different_trivial_solution
    skip
    input =  [[8,2,6,5,9,4,3,1,7],
              [7,1,5,6,3,8,9,4,2],
              [3,9,4,7,2,1,8,6,5],
              [1,6,3,4,5,9,2,7,8],
              [9,4,8,2,6,7,1,5,3],
              [2,5,7,8,1,3,6,9,4],
              [5,3,1,9,4,2,7,8,6],
              [4,0,2,1,7,6,5,3,9],
              [6,7,9,3,8,5,4,2,1]]
    solver = Solver.new(input)
    solution = solver.solve
    assert_equal 8, solution[7][1].value
  end

  def test_it_can_solve_a_harder_trivial_solution
    skip
    input =  [[0,2,6,5,9,4,3,1,7],
              [7,1,5,6,3,8,9,4,2],
              [3,9,4,7,2,1,8,6,5],
              [1,6,3,4,5,9,2,7,8],
              [9,4,8,2,6,7,1,5,3],
              [2,5,7,8,1,3,6,9,4],
              [5,3,1,9,4,2,7,8,6],
              [4,8,2,1,7,6,5,3,9],
              [6,7,9,3,8,5,4,2,1]]
    solver = Solver.new(input)
    solution = solver.solve
    assert_equal 8, solution[0][0].value
  end

  def test_it_can_handle_a_vertical_problem
    skip
    input =  [[0,0,0,0,0,0,0,0,0],
              [7,1,5,6,3,8,9,4,2],
              [3,9,4,7,2,1,8,6,5],
              [1,6,3,4,5,9,2,7,8],
              [9,4,8,2,6,7,1,5,3],
              [2,5,7,8,1,3,6,9,4],
              [5,3,1,9,4,2,7,8,6],
              [4,8,2,1,7,6,5,3,9],
              [6,7,9,3,8,5,4,2,1]]
    solver = Solver.new(input)
    solution = solver.solve
    assert_equal 8, solution[0][0].value
  end

  def test_it_can_handle_a_different_vertical_problem
    skip
    input =  [[0,2,6,5,9,4,3,1,7],
              [7,0,5,6,3,8,9,4,2],
              [3,9,0,7,2,1,8,6,5],
              [1,6,3,0,5,9,2,7,8],
              [9,4,8,2,0,7,1,5,3],
              [2,5,7,8,1,0,6,9,4],
              [5,3,1,9,4,2,0,8,6],
              [4,8,2,1,7,6,5,0,9],
              [6,7,9,3,8,5,4,2,0]]
    solver = Solver.new(input)
    solution = solver.solve
    assert_equal 8, solution[0][0].value
  end

  def test_it_can_solve_a_different_horizontal
    skip
    input =  [[0,2,6,5,9,4,3,1,7],
              [0,1,5,6,3,8,9,4,2],
              [0,9,4,7,2,1,8,6,5],
              [0,6,3,4,5,9,2,7,8],
              [0,4,8,2,6,7,1,5,3],
              [0,5,7,8,1,3,6,9,4],
              [0,3,1,9,4,2,7,8,6],
              [0,8,2,1,7,6,5,3,9],
              [0,7,9,3,8,5,4,2,1]]
    solver = Solver.new(input)
    solution = solver.solve
    assert_equal 8, solution[7][1].value
  end

  def test_it_can_solve_the_easy_ones
    skip
    input =  [[8,0,0,5,0,4,0,0,7],
              [0,0,5,0,3,0,9,0,0],
              [0,9,0,7,0,1,0,6,0],
              [1,0,3,0,0,0,2,0,8],
              [0,4,0,0,0,0,0,5,0],
              [2,0,7,8,1,3,6,0,4],
              [0,3,0,9,0,2,0,8,0],
              [0,0,2,0,7,0,5,0,0],
              [6,0,0,3,0,5,0,0,1]]
    solver = Solver.new(input)
    solution = solver.solve
  end
  def test_it_can_solve_the_real_thing
    input =  [[8,0,0,5,0,4,0,0,7],
              [0,0,5,0,3,0,9,0,0],
              [0,9,0,7,0,1,0,6,0],
              [1,0,3,0,0,0,2,0,8],
              [0,4,0,0,0,0,0,5,0],
              [2,0,7,8,1,3,6,0,4],
              [0,3,0,9,0,2,0,8,0],
              [0,0,2,0,7,0,5,0,0],
              [6,0,0,3,0,5,0,0,1]]
    solver = Solver.new(input)
    solution = solver.solve

    assert_equal 7, solution[7][7].value
    assert_equal 1, solution[1][1].value
    assert_equal 4, solution[2][2].value
  end

  def test_it_can_solve_one_with_a_lot_of_squares
    skip
    input =  [[0,2,6,0,9,4,0,1,7],
              [7,1,5,6,3,8,9,4,2],
              [3,9,4,7,2,1,8,6,5],
              [0,6,3,0,5,9,0,7,8],
              [9,4,8,2,6,7,1,5,3],
              [2,5,7,8,1,3,6,9,4],
              [0,3,1,0,4,2,0,8,6],
              [4,8,2,1,7,6,5,3,9],
              [6,7,9,3,8,5,4,2,1]]
    solver = Solver.new(input)
    solution = solver.solve
    assert_equal 8, solution[0][0].value
    assert_equal 5, solution[0][3].value
    assert_equal 3, solution[0][6].value
    assert_equal 1, solution[3][0].value
    assert_equal 4, solution[3][3].value
  end
end
