Rails.application.routes.draw do
  namespace :admin do
    get 'orders/edit'
    get 'orders/search'
    get 'orders/show'
  end
  namespace :admin do
    get 'subscriptions/index'
    get 'subscriptions/artist'
  end
  namespace :admin do
    get 'communities/new'
    get 'communities/request_index'
  end
  get 'admins/index'
  get 'orders/show'
  namespace :shopping_cart do
    get 'orders/new'
  end
  get 'shopping_carts/show'
  namespace :order do
    get 'subscriptions/new'
  end
  namespace :community do
    get 'requests/new'
  end
  namespace :community do
    get 'questions/index'
    get 'questions/new'
  end
  get 'items/show'
  get 'items/new'
  get 'items/edit'
  get 'communities/show'
  get 'communities/qa_show'
  get 'search/index'
  get 'users/show'
  get 'users/edit'
  get 'users/cancel_show'
  get 'users/ranking_show'
  get 'users/my_community_index'
  get '/users/cancel', to: 'users#cancel_show'
  post '/users/cancel', to: 'useers#cancel_update'
  namespace :user do
    resources :credits, only: [:new, :create]
  end
  namespace :user do
    get 'histories/all'
    get 'histories/index'
    get 'histories/show'
  end
  devise_for :users
  get 'admin/sign_in', action: :new, controller: 'devise/sessions'
  post 'admin/sign_in', action: :create, controller: 'devise/sessions'
	root to: 'home#index'
end
