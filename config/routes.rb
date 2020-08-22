Rails.application.routes.draw do
  namespace :tasks do
    get 'completed/index'
  end
  namespace :tasks do
    get 'active/index', as: :active
  end
  resources :tasks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
