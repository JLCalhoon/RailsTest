Rails.application.routes.draw do
  get 'reaction/new'
  get 'reaction/create'
  get 'reaction/destroy'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :victories
  #get 'home/index'

  get 'home/about'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  put '/victory/:id/react_heart', to: 'victories#react_heart', as: "react_heart"
  put '/victory/:id/react_thumb', to: 'victories#react_thumb', as: "react_thumb"
  put '/victory/:id/react_cool', to: 'victories#react_cool', as: "react_cool"
  put '/victory/:id/react_crazy', to: 'victories#react_crazy', as: "react_crazy"
end
