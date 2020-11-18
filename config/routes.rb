Rails.application.routes.draw do
  root to: 'home#index'

  get 'school', to: 'school#index'
  get 'school/:id', to: 'school#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
