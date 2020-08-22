Rails.application.routes.draw do
  resources :tasks, only: [:index, :create, :update, :destroy] do
    collection do
      get 'active', to: 'tasks/active#index'
      get 'completed', to: 'tasks/completed#index'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
