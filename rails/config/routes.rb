Rails.application.routes.draw do
  devise_scope :user do
    get "/sessions/current" => "ember_devise_simple_auth/sessions#show"
  end

  devise_for :users, controllers: { sessions: 'ember_devise_simple_auth/sessions' }, controllers: { sessions: 'ember_devise_simple_auth/sessions' }, controllers: { sessions: 'sessions' }

  namespace :api do
    get :csrf, to: 'csrf#index'
    resources :food_nutrients, except: [:new, :edit]
    resources :food_items, except: [:new, :edit]
  end
end
