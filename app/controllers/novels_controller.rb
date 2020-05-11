class NovelsController < ApplicationController

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
    def novel_params
      params.require(:novel).permit(:user_id, :title, :body, :caption, :genre)
    end

end
