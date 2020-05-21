class HomesController < ApplicationController

	def top
		@novels = Novel.last(10)
	end

	def about

	end

end
