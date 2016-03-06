Rails.application.routes.draw do
  
  	## give all access to new_file
  	resources :new_files do
    collection { post :import }
  end

  	## respect to only these paths as public
  	match 'new_file' => 'new_files#index', via: [:get]
  	match 'new_file/new' => 'new_files#new', via: [:get]
  	match 'new_file/create' => 'new_files#create', via: [:post]
  	match 'new_file/show' => 'new_files#show', via: [:get]

  	match 'lines/:line' => 'lines#get', via: [:get]

  	root 'lines#index'
end
