Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
   root to: 'tasks#index'
   #トップページにアクセス、indexがトップページ
   resources :tasks
  #編集したり削除したりのいろんな動作が可能になる
   resources :users, only: [:index, :show, :new, :create]
end
