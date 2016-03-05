Rails.application.routes.draw do
	resources :articles

  	match 'lines/newfile' => 'lines#newfile', via: [:get,:post]
  	match 'lines/:line' => 'lines#get', via: [:get]

  	root 'lines#index'
end
