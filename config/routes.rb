Rails.application.routes.draw do

  devise_for :users
  resources :subjects
  root 'subjects#index'

end
