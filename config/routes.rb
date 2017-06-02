Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :users
	resources :students
	#resources :users_get
	get "/users_get" ,to:"users_get#index" 
	get "/users_get/update" ,to:"users_get#update"
	root 'users#index'
end
