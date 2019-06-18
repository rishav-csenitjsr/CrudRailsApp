Rails.application.routes.draw do
  root 'home#index'


  resources :users
  resources :uploads
  get 'download_pdf', to: "uploads#download_pdf"
  resources :sessions, only: [:new, :create, :destroy]
  # get ''
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
