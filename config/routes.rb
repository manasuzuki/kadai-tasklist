Rails.application.routes.draw do
  
  
   root to: 'tasks#index'
   #トップページにアクセス、indexがトップページ
   resources :tasks
  #編集したり削除したりのいろんな動作が可能になる
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signin', to: 'users#new'
   resources :users, only: [:new, :create]
   
end
