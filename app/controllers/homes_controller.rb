class HomesController < ApplicationController

	def top
		@novels = Novel.find(Favorite.group(:novel_id).order('count(novel_id) desc').limit(10).pluck(:novel_id))
	end

	def about

	end

end
