require "./lib/solver"
class Sudoku
  def initialize
    solve_puzzle
  end

  def solve_puzzle
    file_name = ARGV[0]
    puts "hello"
    raw_puzzle = File.read(file_name)
    puzzle = format_puzzle(raw_puzzle)
    solver = Solver.new(puzzle)
    puts puzzle
    solution = solver.solve
    puts solution
  end

  def format_puzzle(puzzle)
    rows = puzzle.split("\n")
    rows.map { |row| row.split("") }
  end
end
s = Sudoku
#filename = ARGV[0]
#puzzle = File.read(filename)
#solver = Solver.new
#solution = solver.solve(puzzle)
#puts solution
