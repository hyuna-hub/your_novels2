class NovelsController < ApplicationController

	def index
		@novels = Novel.all
	end

	def show
		@novel = Novel.find(params[:id])
		@user = @novel.user
		@comment = Comment.new
    	@comments = @novel.comments
	end

	def new
		@novel = Novel.new
	end

	def create
		@novel = Novel.new(novel_params)
      	@novel.user_id = current_user.id
    	if @novel.save
           flash[:notice] = '小説を作成しました。'
           redirect_to novel_path(@novel.id)
    	else
           @novels = Novel.all
           flash[:notice] = '小説の作成に失敗しました。'
      	   render '/users/show'
  	  	end
  	end

	def edit
		@novel = Novel.find(params[:id])
    	if @novel.user_id != current_user.id
       	   redirect_to novel_path(@novel.id)
    	end
	end

	def update
		@novel = Novel.find(params[:id])
		if @novel.update(novel_params)
		   flash[:notice] = '小説を更新しました。'
		   redirect_to novel_path(@novel.id)
  		else
  		   flash[:notice] = '小説の更新に失敗しました。'
      	   render :edit
		end
	end

	def destroy
		@novel = Novel.find(params[:id])
		@user = current_user
        @novel.destroy
        redirect_to user_path(@user.id)
	end

	private
    def novel_params
      params.require(:novel).permit(:user_id, :title, :body, :caption, :genre)
    end

end
