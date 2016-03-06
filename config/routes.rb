Rails.application.routes.draw do
  
  	## give all access to new_file
  	resources :new_files

  	## respect to only these paths as public
  	match 'new_files' => 'new_files#index', via: [:get]
  	match 'new_files/new' => 'new_files#new', via: [:get]
  	match 'new_files/create' => 'new_files#create', via: [:post]
  	match 'new_files/show' => 'new_files#show', via: [:get]

  	match 'lines/:line' => 'lines#get', via: [:get]

  	root 'lines#index'
end
