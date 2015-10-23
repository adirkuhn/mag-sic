Rails.application.routes.draw do
  resources :invites
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :moots
  resources :plans

  #admin
  get 'admin/index'

  #home
  get 'home/index'
  get 'home/buy/:id', to: 'home#buy', as: 'home_buy'
  post 'home/choose_plan', as: 'home_choose_plan'

  root 'home#index'
end
