Rails.application.routes.draw do
  root 'home#show'
  resources :tasks, only: [:index, :create, :edit, :update, :destroy] do
    collection do
      get 'active', to: 'tasks/active#index'
      get 'completed', to: 'tasks/completed#index'
    end
  end

  get 'callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
