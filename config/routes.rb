Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

	scope :api do
		resources :sudoku, only: [:create] do

		end
	end

	# post "/api/sudoku", to: "sudoku#create"
end
