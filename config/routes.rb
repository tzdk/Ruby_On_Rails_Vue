Rails.application.routes.draw do

  #get 'sessions/new'

  get 'users/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :employees
  get 'welcome/index'

  root 'welcome#index'
  match '*path' => 'application#cors_preflight_check', :via => :options
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
