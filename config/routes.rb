Rails.application.routes.draw do
  root to: 'welcome#index'
  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions'}
  get 'welcome/index'
  get '/targets/load_create_target' => 'targets#load_create_target', as: :load_create_target
  get '/targets/load_delete_target' => 'targets#load_delete_target', as: :load_delete_target
  get '/targets/list' => 'targets#list', as: :list
  as :user do
    get 'users/registrations/confirmation_page', to: 'users/registrations#confirmation_page'
  end
 resources :users
 resources :targets

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
