Rails.application.routes.draw do
  get 'attachments/create'

  resources :companies do
    resources :moots do #, shallow: true
      resources :rullings
    end
  end
  devise_for :users, controllers: { registrations: "users/registrations" }
  #resources :moots
  resources :plans

  resource :attachments

  #admin
  get 'admin/index'

  #home
  get 'home/index'
  get 'home/buy/:id', to: 'home#buy', as: 'home_buy'
  post 'home/choose_plan', as: 'home_choose_plan'

  root 'home#index'


  #company plans
  get 'companies/:id/plans', to: 'companies#plans', as: 'companies_plans'
  get 'companies/:id/plans/:id_plan', to: 'companies#chooseplan', as: 'companies_chooseplan'

  #invite admins and users
  get 'companies/:id/admins', to: 'companies#admins', as: 'companies_admins'
  post 'companies/:id/admins', to: 'companies#admins_save', as: 'companies_admins_save'

  get 'companies/:id/voters', to: 'companies#voters', as: 'companies_voters'
  post 'companies/:id/voters', to: 'companies#voters_save', as: 'companies_voters_save'

end
