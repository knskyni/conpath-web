Rails.application.routes.draw do
  root to: 'home#index'

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
  get 'student/my/password_change', to: 'student#password_edit'
  post 'student/my/password_change', to: 'student#password_update'
  get 'student/my/recruit_profile', to: 'student#recruit_profile'
  post 'student/my/recruit_profile', to: 'student#recruit_profile_update'

  # 教員
  get 'teacher/login', to: 'teacher#login'
  post 'teacher/login', to: 'teacher#auth'
  post 'teacher/logout', to: 'teacher#logout'
  get 'teacher/new', to: 'teacher#new'
  post 'teacher/create', to: 'teacher#create'
  get 'teacher/my/edit', to: 'teacher#edit'
  post 'teacher/my/update', to: 'teacher#update'
  get 'teacher/my/password_change', to: 'teacher#password_edit'
  post 'teacher/my/password_change', to: 'teacher#password_update'

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
  get 'company', to: 'company#index'
  get 'company/new', to: 'company#new'
  post 'company/create', to: 'company#create'
  get 'company/:id', to: 'company#show'
  get 'company/:id/edit', to: 'company#edit'
  patch "company/:id/update", to: 'company#update'

  # 求人
  get 'post/new/:company_id', to: 'post#new'
  post 'post/create/:company_id', to: "post#create"
  get 'post/search', to: 'post#search'
  get 'post/search_result', to: 'post#search_result'
  get 'post/:id', to: 'post#show'
  get 'post/:id/edit', to: 'post#edit'
  post 'post/:id/update', to: 'post#update'

  # 就職活動
  get 'activity', to: 'activity#index'
  post 'activity/new/:post_id', to: 'activity#create'
  get 'activity/:id', to: 'activity#show'
  post 'activity/:id/action/create', to: 'activity#create_action'
  get 'activity/:entry_id/action/:action_id/edit', to:'activity#edit_action'
  post 'activity/:entry_id/action/:action_id/update', to:'activity#update_action'
  delete 'activity/:entry_id/action/:action_id/destroy', to:'activity#destroy_action'
  get 'activity/:entry_id/success', to: 'activity#new_success'
  post 'activity/:entry_id/success', to: 'activity#create_success'
  get 'activity/:entry_id/retire', to: 'activity#new_retire'
  post 'activity/:entry_id/retire', to: 'activity#create_retire'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
