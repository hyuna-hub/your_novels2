class FavoritesController < ApplicationController

	def new
		
	end

	def create
		
	end

	def destroy
		
	end

	private
    def favorite_params
      params.require(:favorite).permit(:user_id, :novel_id)
    end

end
