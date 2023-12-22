Rails.application.routes.draw do
  devise_for :users
  resources :films do
    resources :reviews
  end

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  resources :films
  root 'films#index'
end
