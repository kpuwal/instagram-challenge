Rails.application.routes.draw do
  devise_for :users

  root "pictures#index"
  resources :pictures do
    resources :comments
    resources :endorsements
  end
end
