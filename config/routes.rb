Rails.application.routes.draw do

  resources :users

  resources :categories



  resources :stories do
    resources :small_stories
    resources :comments, module: :stories
  end


  post 'passwords/forgot', to: 'passwords#forgot'
  post 'passwords/reset', to: 'passwords#reset'
  post 'auth/login' , to: 'authentications#login'
  post 'auth/register' , to: 'authentications#register'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

