Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/add', to: 'media_resources#new', as: 'media_resources'
  post '/add', to: 'media_resources#create', as: 'new_media_resources'
  get '/bookmarks/:id', to: 'media_resources#show', as: 'media_resource'
end
