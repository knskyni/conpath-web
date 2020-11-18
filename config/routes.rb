Rails.application.routes.draw do
  get 'company/create', to: 'company#create_form'
  post 'company/create', to: 'company#create'
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
