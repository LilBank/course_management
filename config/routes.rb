Rails.application.routes.draw do
  devise_for :users
  resources :users
  root "home#index"
  resources :courses do 
    member do
      get 'view_students'
      get 'subscribe_course'
      get 'un_subscribe_course'
    end
  end

  resources :groups  do 
    member do
      get 'view_students'
      get 'remove_from_group'
    end
    collection do 
      post 'add_to_group'
    end
  end

  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
