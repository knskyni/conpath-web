Rails.application.routes.draw do
  root to: 'home#index'

  get 'recruit_post/new', to: 'recruit_post#new'
  post 'recruit_post/create', to: "posts#create"

end
