Rails.application.routes.draw do

  devise_for :users
  resources :subjects do
    resources :labs
  end
  root 'subjects#index'
end
