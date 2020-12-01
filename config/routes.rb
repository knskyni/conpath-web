Rails.application.routes.draw do
  root to: 'home#index'

  get 'recruit_post/new/:company_id', to: 'recruit_post#new'
  post 'recruit_post/create/:company_id', to: "recruit_post#create"
  get 'recruit_post/edit/:company_id', to: 'recruit_post#edit'

end
