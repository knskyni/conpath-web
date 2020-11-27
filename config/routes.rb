Rails.application.routes.draw do
  root to: 'home#index'

  get 'teacher/new', to: 'teacher#new'
  post 'teacher/new', to: 'teacher#create'
  get 'teacher/:id', to: 'teacher#show'
<<<<<<< HEAD
>>>>>>> feat: Teacherコントローラのnewアクションを実装
=======
>>>>>>> teacher_create
end
