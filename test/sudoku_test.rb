require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sudoku'

class SudokuTest < Minitest::Test
  def test_it_solves_a_medium_difficulty_thing
    skip
    input = "8  5 4  7\n" +
            "  5 3 9  \n" +
            " 9 7 1 6 \n" +
            "1 3   2 8\n" +
            " 4     5 \n" +
            "2 78136 4\n" +
            " 3 9 2 8 \n" +
            "  2 7 5  \n" +
            "6  3 5  1\n"
    solver = Solver.new
    solution = solver.solve(input)
    output =  "826594317\n" +
              "715638942\n" +
              "394721865\n" +
              "163459278\n" +
              "948267153\n" +
              "257813694\n" +
              "531942786\n" +
              "482176539\n" +
              "679385421\n"
    assert_equal output, solution
  end

end