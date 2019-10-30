Rails.application.routes.draw do
  get 'users/show'
  get 'pages/home'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'user', to: 'users#profile', as: :profile
  # resources :users, only: [ :show ] # I want to show the airplane listing/booking the user have when opening the user profile
  resources :airplanes do
    resources :bookings, only: [ :create, :destroy]
  end
  resources :bookings, only: [ :index, :show ] do
   resources :reviews, only: [ :create ]
 end
  # Reviews cannot be edited and will all be shown at the page when you want to reserve the plane with description, etc
  # what if I want to have two separate reviews? one from the host one from the guest
end
