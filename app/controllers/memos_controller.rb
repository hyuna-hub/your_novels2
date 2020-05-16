class MemosController < ApplicationController

	def index
		
	end

	def show
		
	end

	def new
		@memo = Memo.new
	end

	def create
		@memo = Memo.new(memo_params)
      	@memo.user_id = current_user.id
    	if @memo.save
           flash[:notice] = 'メモを作成しました。'
           redirect_to memo_path(@memo.id)
    	else
           @memos = Memo.all
           flash[:notice] = 'メモの作成に失敗しました。'
      	   render :index
  	  	end
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private
    def memo_params
      params.require(:memo).permit(:user_id, :title, :body)
    end

end
