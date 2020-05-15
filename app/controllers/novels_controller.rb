class NovelsController < ApplicationController

	def index
		
	end

	def show
		@novel = Novel.find(params[:id])
		@user = @novel.user
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
        	@novels = Book.all
        	flash[:notice] = '小説の作成に失敗しました。'
      		render template:"users/show"
  	  	end
  end
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
