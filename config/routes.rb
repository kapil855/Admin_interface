Rails.application.routes.draw do
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :articles, only: [:show, :index]
  #get 'home/index'
  devise_for :users, controllers: {
       # sessions: 'users/sessions'
  }

  namespace :admin do
  	resources :articles
  end
  
end
