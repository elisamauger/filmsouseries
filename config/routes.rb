Filmsouseries::Application.routes.draw do

	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	get '/logout' => 'sessions#destroy'

	get '/signup' => 'users#new'
	post '/users' => 'users#create'
end

Rails.application.routes.draw do
  resources :series
  get '/series/:id/set_checked/:checked' => 'series#set_checked'
  resources :films
  get '/films/:id/set_checked/:checked' => 'films#set_checked'
  resources :documentaires
  get '/documentaires/:id/set_checked/:checked' => 'documentaires#set_checked'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end