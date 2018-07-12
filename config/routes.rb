Rails.application.routes.draw do
  
  get 'admin/users'
  get 'admin/users/:id/change' => 'admin#change'
  
  devise_for :users #devise gem 설치 했더니 따란~~
  root 'works#index'
  
  resources(:works)
  
  resources :makers
end
