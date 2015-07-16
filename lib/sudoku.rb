require "./lib/solver"
class Sudoku

  def solve_puzzle
    file_name = ARGV[0]
    puzzle_lines = File.readlines(file_name)
    puzzle = format_puzzle(puzzle_lines)
    solver = Solver.new(puzzle)
    raw_solution = solver.solve
    solution = format_solution(raw_solution)
    puts solution
  end

  def format_puzzle(puzzle_lines)
    puzzle_lines.map do |row|
      elements = row.chars
      elements.map { |element| element.to_i }
    end
  end

  def format_solution(raw_solution)
    raw_solution.map { |row| row.map { |element| element.value.to_s }.join}
  end
end
s = Sudoku.new
s.solve_puzzle

