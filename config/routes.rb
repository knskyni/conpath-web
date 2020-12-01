Rails.application.routes.draw do
  root to: 'home#index'

  get 'recruit_post/new/:company_id', to: 'recruit_post#new'
  post 'recruit_post/create/:company_id', to: "recruit_post#create"
  get 'recruit_post/show/id', to: 'recruit_post#show'
  get 'recruit_post/edit/:id', to: 'recruit_post#edit'
  post 'recruit_post/update/:id', to: 'recruit_post#update'

end
