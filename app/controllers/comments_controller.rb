class CommentsController < ApplicationController

	def new
		
	end

	def create
		
	end

	def destroy
		
	end

	private
    def comment_params
      params.require(:comment).permit(:user_id, :novel_id, :body)
    end

end
