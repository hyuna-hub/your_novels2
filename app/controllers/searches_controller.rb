class SearchesController < ApplicationController

	def search
    	@model = params["search"]["model"]
    	@content = params["search"]["content"]
    	@records = search_for(@model, @content)
  end

  private
  	def search_for(model, content)
  	  if model == 'user'
      	User.where('name LIKE ?', '%'+content+'%')
  	  elsif model == 'novel'
      	Novel.where('title LIKE ?', '%'+content+'%')
      elsif model == 'genre'
      	Novel.where(genre: content)
  	  end
    end
  end
