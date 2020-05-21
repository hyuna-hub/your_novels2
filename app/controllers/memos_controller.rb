class MemosController < ApplicationController

	def index
		@memos = Memo.order("id DESC")
		@user = current_user
	end

	def show
		@memo = Memo.find(params[:id])
		@user = current_user
	end

	def new
		@memo = Memo.new
		@user = current_user
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
		@memo = Memo.find(params[:id])
		@user = current_user
	end

	def update
		@memo = Memo.find(params[:id])
		if @memo.update(memo_params)
		   flash[:notice] = 'メモを更新しました。'
		   redirect_to memo_path(@memo.id)
  		else
  		   flash[:notice] = 'メモの更新に失敗しました。'
      	   render :edit
		end
	end

	def destroy
		@memo = Memo.find(params[:id])
		@user = current_user
        @memo.destroy
        redirect_to user_path(@user.id)
	end

	private
    def memo_params
      params.require(:memo).permit(:user_id, :title, :body)
    end

end
