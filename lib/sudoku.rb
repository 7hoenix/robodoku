
class Sudoku
  def initialize
    solve_puzzle
  end

  def solve_puzzle
    file_name = ARGV[0]
    puzzle = File.read(filename)
    solver = Solver.new
    solution = solver.solve(puzzle)
  end
end
#filename = ARGV[0]
#puzzle = File.read(filename)
#solver = Solver.new
#solution = solver.solve(puzzle)
#puts solution
