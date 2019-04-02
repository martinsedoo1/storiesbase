Rails.application.routes.draw do

  resources :users

  resources :categories

  resources :small_stories do
    resources :comments, module: :small_stories
  end

  resources :stories do
    resources :comments, module: :stories
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
