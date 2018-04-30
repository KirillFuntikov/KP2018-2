Rails.application.routes.draw do

  get 'statistics/generate_scv_user'
  get 'statistics/generate_csv_lab'
  get 'statistics/generate_csv_subject'

  devise_for :users
  resources :subjects do
    resources :labs
  end
  root 'subjects#index'
end
