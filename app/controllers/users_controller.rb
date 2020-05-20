class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def search
		@users = Array.new
		if request.post? then
			@users = User.where "mail like ?",
			'%' + params[:find] + '%'
		end
	end

	def show
		@user = User.find(params[:id])
		@novels = @user.novels
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
    	if @user.update(user_params)
    	   flash[:notice] = 'プロフィールを更新しました'
      	   redirect_to user_path(@user)
    	else
      	   render :edit
    	end
	end

	def destroy
		user = User.find(params[:id])
        user.destroy
        redirect_to root_path
	end

	private
    def user_params
      params.require(:user).permit(:name, :email, :password, :profile_image, :introduction)
    end

end
