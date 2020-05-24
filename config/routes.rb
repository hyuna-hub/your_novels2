Rails.application.routes.draw do
  root 'homes#top'
	get 'home/about', to: 'homes#about'
  get '/search', to: 'searches#search'

	resources :novels do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
	end

  resources :memos

  devise_for :users
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
