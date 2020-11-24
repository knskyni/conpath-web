Rails.application.routes.draw do
  get 'company/create', to: 'company#create_form'
  post 'company/create', to: 'company#create'
  get 'company/:id', to: 'company#show'
  get 'company/:id/edit', to: 'company#edit'
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
