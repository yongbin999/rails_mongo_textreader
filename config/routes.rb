Rails.application.routes.draw do
	resources :articles

  	match 'page/:line' => 'page#get', via: [:get]
  	root 'page#index'
end
