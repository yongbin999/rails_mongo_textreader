Rails.application.routes.draw do
	resources :articles

  	match 'lines/:line' => 'lines#get', via: [:get]
  	match 'lines/newfile' => 'lines#newflie', via: [:get,:post]

  	root 'lines#index'
end
