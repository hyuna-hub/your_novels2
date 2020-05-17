class FavoritesController < ApplicationController

  def create
    @novel = Novel.find(params[:novel_id])
    favorite = @novel.favorites.new(user_id: current_user.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @novel = Novel.find(params[:novel_id])
    favorite = current_user.favorites.find_by(novel_id: @novel.id)
    favorite.destroy
    redirect_to request.referer
  end

	private
    def favorite_params
      params.require(:favorite).permit(:user_id, :novel_id)
    end

    def redirect
    	case params[:redirect_id].to_i
    	when 0
      		redirect_to novels_path
    	when 1
      		redirect_to novel_path(@novel)
    	end
  	end

end
