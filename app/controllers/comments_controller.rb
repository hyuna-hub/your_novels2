class CommentsController < ApplicationController

  	def create
    	# @novel = Novel.find(params[:novel_id])
    	@comment = Comment.new
    	@comment.user_id = current_user.id
    	# @comment.novel_id = @novel.id
    	if @comment.save
      	   flash[:success] = "コメントを投稿しました。"
      	   redirect_to request.referer
    	else
      	   # @comments = Comment.where(novel_id: @comment.novel_id)
      	   # render '/novels/show'
           flash[:success] = "コメントを投稿に失敗しました。"
           redirect_to request.referer
    	end
  	end

  	def destroy
    	@comment = Comment.find(params[:novel_id])
    	if @comment.user != current_user
      	   redirect_to request.referer
    	end
    	@comment.destroy
    	redirect_to request.referer
  	end

	private
    def comment_params
      params.require(:comment).permit(:user_id, :novel_id, :body)
    end

end
