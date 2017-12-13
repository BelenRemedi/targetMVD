Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users, controllers:
    { registrations: 'users/registrations', sessions: 'users/sessions' }

  as :user do
    get 'users/registrations/confirmation_page', to: 'users/registrations#confirmation_page'
  end
  resources :users, only: [:new]

  resources :targets do
    collection do
      get 'load_create_target'
      get 'load_delete_target'
      get 'list'
    end
  end

  resources :messages, only: [:create]

  resources :chats, only: [:index] do
    collection do
      get 'load_chat'
    end
  end

  resources :welcome, only: [:index] do
    collection do
      get 'load_chats'
      get 'update_chats'
    end
  end

  mount ActionCable.server, at: '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
