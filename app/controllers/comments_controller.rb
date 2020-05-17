class CommentsController < ApplicationController

  	def create
    	@novel = Novel.find(params[:novel_id])
    	@comment = @novel.comments.new(comment_params)
    	@comment.user_id = current_user.id
    	@comment.novel_id = @novel.id
    	if @comment.save
      	   flash[:success] = "コメントを投稿しました。"
      	   redirect_to novel_path(@novel)
    	else
      	   @comments = Comment.where(novel_id: @novel.id)
      	   render '/novels/show'
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
