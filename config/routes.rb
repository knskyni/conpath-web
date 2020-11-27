Rails.application.routes.draw do
  root to: 'home#index'

  get 'teacher/new', to: 'teacher#new'
<<<<<<< 16517a33bfb5d964be6b773367967d3671b440b9
  post 'teacher/create', to: 'teacher#create'
=======
  post 'teacher/new', to: 'teacher#create'
  get 'teacher/:id', to: 'teacher#show'
>>>>>>> feat: Teacherコントローラのnewアクションを実装
end
