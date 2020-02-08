Rails.application.routes.draw do
   root to: 'tasks#index'
   #トップページにアクセス、indexがトップページ
   resources :tasks
  #編集したり削除したりのいろんな動作が可能になる
end
