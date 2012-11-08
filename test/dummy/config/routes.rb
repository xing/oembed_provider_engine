Rails.application.routes.draw do

  mount OembedProviderEngine::Engine => "/oembed"

  resources :photos
  resources :items
end
