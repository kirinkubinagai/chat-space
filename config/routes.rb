Rails.application.routes.draw do
  devise_for :users
  root "chat_groups#index"
  resources :chat_groups do
    resources :messages, only: [:index,:create]
  end
  resources :users do
    get :search,on: :collection
  end
end
