Rails.application.routes.draw do
  root to: 'welcome#index'
  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions'}
  get 'welcome/index'
  as :user do
    get 'users/registrations/confirmation_page', to: 'users/registrations#confirmation_page'
  end
 resources :users

 resources :targets do
   collection do
     get 'load_create_target'
     get 'load_delete_target'
     get 'list'
   end
 end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
