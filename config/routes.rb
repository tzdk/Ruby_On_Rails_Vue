Rails.application.routes.draw do

  get 'users/new'

  resources :employees
  get 'welcome/index'

  root 'welcome#index'
  match '*path' => 'application#cors_preflight_check', :via => :options
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
