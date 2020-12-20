module SudokuHelper

	class Sudoku

		attr_accessor :problem
		# Logic:
		#  find empty cells,  check possible values, validate for each possible value (bfs/dfs) 
		# sample problem
		# [
		# 	[2, null, 5, null, null, 9, null, null, 4],
		# 	[null, null, null, null, null, null, 3, null, 7],
		# 	[7, null, null, 8, 5, 6, null, 1, null],
		# 	[4, 5, null, 7, null, null, null, null, null],
		# 	[null, null, 9, null, null, null, 1, null, null],
		# 	[null, null, null, null, null, 2, null, 8, 5],
		# 	[null, 2, null, 4, 1, 8, null, null, 6],
		# 	[6, null, 8, null, null, null, null, null, null],
		# 	[1, null, null, 2, null, null, 7, null, 8]
		# ]
		# eg. [[2, nil, 5, nil, nil, 9, nil, nil, 4], [nil, nil, nil, nil, nil, nil, 3, nil, 7], [7, nil, nil, 8, 5, 6, nil, 1, nil], [4, 5, nil, 7, nil, nil, nil, nil, nil], [nil, nil, 9, nil, nil, nil, 1, nil, nil], [nil, nil, nil, nil, nil, 2, nil, 8, 5], [nil, 2, nil, 4, 1, 8, nil, nil, 6], [6, nil, 8, nil, nil, nil, nil, nil, nil], [1, nil, nil, 2, nil, nil, 7, nil, 8]]
		def initialize(pro)
			@problem = pro
		end

		def solve
			er, ec = find_empty
			possibles = possibilities(er, ec)
			return unless possibles.any?
				
			possibles.each do |possible|
				problem[er][ec] = possible
				solve # calling recursively to check validations of guesses on other cells dfs
				return problem unless find_empty
				problem[er][ec] = nil 
			end
		end

		def find_empty
			problem.each_with_index do |row, i|
				row.each_with_index do  |e, j|
					if e == nil
						return [i, j]
					end
				end
			end
			nil
		end


		def possibilities(ri, ci)
			return [] unless [ri, ci].any?
			values = []	
			9.times do |i|
				v = i + 1
				if valid?(ri, ci, v)
					values << v
				end
			end
			values
		end

		def valid?(row, column, possible)
			valid_row?(row, possible) &&
				valid_column?(column, possible) &&
				valid_3x3?(row, column, possible)
		end


		def valid_row?(row, possible)
			!problem[row].include?(possible)
		end

		def valid_column?(column, possible)
			problem.each do |row|
				if row[column] == possible
					return false
				end
			end
			true
		end

		def valid_3x3?(row, column, possible)
			x = (row/3)*3
			y = (column/3)*3
			3.times do |xi|
				3.times do |yi|
					# print x+xi, y+yi, problem[x+xi][y+yi]
					return false if (problem[x+xi][y+yi] == possible)
				end
			end
			true
		end
	end

end
