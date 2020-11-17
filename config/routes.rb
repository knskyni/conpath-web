Rails.application.routes.draw do
  get 'company/create_form'
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
