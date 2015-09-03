Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }
  resources :food_items, except: [:new, :edit]
  namespace :api do
    get :csrf, to: 'csrf#index'
  end
end
