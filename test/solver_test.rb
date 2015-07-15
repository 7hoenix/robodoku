require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/solver'

class SolverTest < Minitest::Test
  def test_it_can_solve_an_already_solved_sudoku
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
end
