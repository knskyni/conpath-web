Rails.application.routes.draw do
  get 'recruit_post/new'
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
