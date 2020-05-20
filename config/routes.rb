Rails.application.routes.draw do
  	root 'homes#top'
	get 'home/about', to: 'homes#about'

	post 'novels/index', to: 'novels#search'
	resources :novels
	resources :memos

  	devise_for :users
  	post 'users/index', to: 'users#search'
  	resources :users

  	resources :favorites, only: [:create, :destroy]
  	resources :comments, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
