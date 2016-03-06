Rails.application.routes.draw do
  resources :new_files
  resources :new_files
  resources :new_files
  resources :new_files

  	match 'new_file' => 'new_files#index', via: [:get,:post]
  	match 'newfile/show/:id' => 'new_files#show', via: [:get,:post]
  	match 'lines/:line' => 'lines#get', via: [:get]

  	root 'lines#index'
end
