class MemosController < ApplicationController

	def index
		
	end

	def show
		
	end

	def new
		
	end

	def create
		
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private
    def memo_params
      params.require(:memo).permit(:user_id, :title, :body)
    end

end
