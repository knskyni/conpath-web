Rails.application.routes.draw do
  root to: 'home#index'

  # 求人
  get 'recruit_post/new/:company_id', to: 'recruit_post#new'
  post 'recruit_post/create/:company_id', to: "recruit_post#create"
  get 'recruit_post/show/:id', to: 'recruit_post#show'
  get 'recruit_post/edit/:id', to: 'recruit_post#edit'
  post 'recruit_post/update/:id', to: 'recruit_post#update'

  # 学生
  get 'student/login', to: 'student#login'
  post 'student/login', to: 'student#auth'
  post 'student/logout', to: 'student#logout'
  get 'student/new', to: 'student#new'
  post 'student/new', to: 'student#create_temp'
  get 'student/activate/:auth_key', to: 'student#activate'
  post 'student/activate/:auth_key', to: 'student#create'
  get 'student/my/edit', to: 'student#edit'
  post 'student/my/update', to: 'student#update'
  get 'student/favorite/edit/:id', to: 'student#favorite_edit'
  get 'student/favorite/list', to: 'student#favorite_list'
  get 'student/password_change', to: 'student#password_edit'
  post 'student/password_change', to: 'student#password_update'
  
  # 教員
  get 'teacher/new', to: 'teacher#new'
  post 'teacher/create', to: 'teacher#create'
  get 'teacher/:id/edit', to: 'teacher#edit'
  post 'teacher/:id/update', to: 'teacher#update'
  get 'teacher/:id/password_change', to: 'teacher#password_edit'
  post 'teacher/:id/password_change', to: 'teacher#password_update'

  # 学校
  get 'school', to: 'school#index'
  get 'school/new', to: 'school#new'
  post 'school/create', to: 'school#create'
  get 'school/:id', to: 'school#show'
  get 'school/:id/edit', to: 'school#edit'
  patch 'school/:id/update', to: 'school#update'

  # 学科
  get 'course/new/:school_id', to: 'course#new'
  post 'course/new/:school_id', to: 'course#create'
  get 'course/:id', to: 'course#show'
  get 'course/:id/edit', to: 'course#edit'
  patch 'course/:id/update', to: 'course#update'

  # クラス
  get 'class/new/:course_id', to: 'school_class#new'
  post 'class/new/:course_id', to:'school_class#create'
  get 'class/:id', to: 'school_class#show'
  get 'class/:id/edit', to: 'school_class#edit'
  patch 'class/:id/update', to: 'school_class#update'

  # 企業
  get 'company/new', to: 'company#new'
  post 'company/create', to: 'company#create'
  get 'company/:id', to: 'company#show'
  get 'company/:id/edit', to: 'company#edit'
  patch "company/:id/update", to: 'company#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
