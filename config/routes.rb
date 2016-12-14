Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'home#index'


  resources :users , only: [:create, :new, :show]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :ideas, shallow: true do
      get :search, on: :collection
      get :flag, on: :member
      resources :likes, only: [:create, :destroy]
      resources :members, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
  
  end
end
