Rails.application.routes.draw do
  get 'card_contents/new'
  get 'card_contents/edit'
  get 'card_contents/create'
  get 'card_contents/update'
  get 'card_contents/destroy'
  root 'home#index'
  get 'feed',:to=>'home#feed'
  resources :comments, only: [:create, :destroy]
  resources :cards do
    resources :card_pictures, only: [:create, :update, :destroy]
  end
  resources :card_contents
  resources :galleries do
    resources :gallery_pictures, only: [:create, :update, :destroy]
  end
  resources :notices

  get "maps/search", to: "maps#search"
  resources :maps
end