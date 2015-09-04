Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }

  namespace :api do
    get :csrf, to: 'csrf#index'
    resources :food_nutrients, except: [:new, :edit]
    resources :food_items, except: [:new, :edit]
  end
end
