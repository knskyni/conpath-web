Rails.application.routes.draw do
  root to: 'home#index'

  get 'student/login', to: 'student#login'
  post 'student/login', to: 'student#auth'
  post 'student/logout', to: 'student#logout'
  get 'student/new', to: 'student#new'
  post 'student/new', to: 'student#create_temp'
  get 'student/activate/:auth_key', to: 'student#activate'
  post 'student/activate/:auth_key', to: 'student#create'
  get 'student/edit/:id', to: 'student#edit'
  post 'student/update/:id', to: 'student#update'
  get 'student/favorite/edit/:id', to: 'student#favorite_edit'
  get 'student/favorite/list', to: 'student#favorite_list'

  get 'student/password_edit/:id', to: 'student#password_edit'
  post 'student/password_update/:id', to: 'student#password_update'

  get 'school', to: 'school#index'
  get 'school/new', to: 'school#new'
  post 'school/create', to: 'school#create'
  get 'school/:id', to: 'school#show'
  get 'school/:id/edit', to: 'school#edit'
  patch 'school/:id/update', to: 'school#update'

  get 'course/new/:school_id', to: 'course#new'
  post 'course/new/:school_id', to: 'course#create'
  get 'course/:id', to: 'course#show'
  get 'course/:id/edit', to: 'course#edit'
  patch 'course/:id/update', to: 'course#update'

  get 'class/new/:course_id', to: 'school_class#new'
  post 'class/new/:course_id', to:'school_class#create'
  get 'class/:id', to: 'school_class#show'
  get 'class/:id/edit', to: 'school_class#edit'
  patch 'class/:id/update', to: 'school_class#update'

  get 'company/new', to: 'company#new'
  post 'company/create', to: 'company#create'
  get 'company/:id', to: 'company#show'
  get 'company/:id/edit', to: 'company#edit'
  patch "company/:id/update", to: 'company#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
