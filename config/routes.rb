Rails.application.routes.draw do
  get 'attachments/create'

  resources :companies do
    resources :moots do #, shallow: true
      resources :rullings do
        resources :rulling_comments
      end
      resource :moot_comments
    end
  end
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }
  #resources :moots
  resources :plans

  # resource :moot_comments

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

  #list company members
  get 'companies/:id/members', to: 'companies#members', as: 'companies_members'
  get 'companies/:id/members_admins', to: 'companies#members_admins', as: 'companies_members_admins'

  #add and delete admin
  post 'companies/:id/admin/add', to: 'companies#admin_add', as: 'companies_admin_add'
  post 'companies/:id/admin/delete', to: 'companies#admin_delete', as: 'companies_admin_delete'

  #invited user to a moot
  get '/companies/:company_id/moots/:id/invited_users', to: 'moots#invited_users', as: 'invited_users'
  post '/companies/:company_id/moots/:id/invited_users/add', to: 'moots#add_invited_users', as: 'add_invited_users'
  post '/companies/:company_id/moots/:id/invited_users/delete', to: 'moots#delete_invited_users', as: 'delete_invited_users'

  #vote rulling
  post '/companies/:company_id/moots/:moot_id/rullings/:id/vote', to: 'rullings#vote', as: 'rulling_vote'
  get '/companies/:company_id/moots/:moot_id/rullings/:id/votestatus', to: 'rullings#vote_status', as: 'rulling_vote_status'
  get '/companies/:company_id/moots/:moot_id/rullings/:id/allvotestatus', to: 'rullings#all_vote_status', as: 'rulling_all_vote_status'

end
