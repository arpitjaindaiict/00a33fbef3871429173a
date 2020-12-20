class SudokuController < ApplicationController
	include SudokuHelper
	skip_before_action :verify_authenticity_token, only: [:create]
	 

	def create
		data = params[:data]
		s = SudokuHelper::Sudoku.new(data)
		s.solve
		render json: s.problem
	end



end
