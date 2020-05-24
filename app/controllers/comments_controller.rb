class CommentsController < ApplicationController

  	def create
    	@novel = Novel.find(params[:novel_id])
    	@comment_new = Comment.new
      @comment = @novel.comments.new(comment_params)
    	@comment.user_id = current_user.id
    	# @comment.novel_id = @novel.id
    	if @comment.save
      	   flash[:success] = "コメントを投稿しました。"
      	   redirect_to novel_path(@novel)
      else
          @comments = Comment.where(novel_id: @novel.id)
          render '/novels/show'
      end

      	   # @comments = Comment.where(novel_id: @comment.novel_id)
          #  @novel = Novel.find(novel_id: @comment.novel_id)
          #  flash[:success] = "コメントを投稿に失敗しました。"
      	   # render '/novels/show'
           # redirect_to request.referer
    	
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
      params.require(:comment).permit(:body)
    end

end
