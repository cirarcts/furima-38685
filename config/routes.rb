Rails.application.routes.draw do

  get 'items/index'
  get 'items/new'
  devise_for :users
  root to: "items#index"
  resources :items do
    collection do
      get 'search'
    end
    resources :orders, only: [:index, :create]
  end

end
