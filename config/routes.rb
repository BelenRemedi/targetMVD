Rails.application.routes.draw do

  get 'welcome/index'
  get '/targets/load_create_target' => 'targets#load_create_target', as: :load_create_target

  root 'welcome#index'

 resources :users
 resources :targets

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
