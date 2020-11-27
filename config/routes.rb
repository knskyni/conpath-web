Rails.application.routes.draw do
  get 'recruit/post/new', to: 'recruit_post#new'
  root to: 'home#index'
  get recruit/post/new => "posts#new"
  post 'recruit/post/create' => 'posts#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
