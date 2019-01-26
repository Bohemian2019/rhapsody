Rails.application.routes.draw do

  #get 'artists/new'
  #get 'artists/create'
  mount RailsAdmin::Engine => '/administrator', as: 'rails_admin'
  # devise
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  get 'admin/sign_in', action: :new, controller: 'devise/sessions'
  post 'admin/sign_in', action: :create, controller: 'devise/sessions'

  # 退会ページからlogout用ルーティング
  devise_scope :user do
   get '/logout', to: 'devise/sessions#destroy', as: :logout
  end

  # admin/
  namespace :admin do
    # subscriptions
    get 'subscription/index', to: 'subscriptions#index', as: :subscription_index
    get 'subscription/artist/:id', to: 'subscriptions#artist', as: :subscription_artist
    post 'subscription/artist/:id', to: 'subscriptions#order_send'
    # communities
    get 'communities/new'
    get 'communities/request_index'
    # orders
    resources :orders, only: [:show, :edit, :update]
    get 'orders', to: 'orders#search'
    patch 'orders', to: 'orders#update'
  end

  # shopping_carts
  get 'shopping_cart/:id', to: 'shopping_carts#show', as: :shopping_cart_show
  post'shopping_cart/:id', to: 'shopping_carts#increment'
  post 'shopping_cart/:id', to: 'shopping_carts#decrement'
  post 'shopping_cart/:id', to: 'shopping_carts#pass'
  delete 'shopping_cart/:id', to: 'shopping_carts#delete'

  # shopping_cart/
  namespace :shopping_cart do
    # orders
    get ':id/order', to: 'orders#new', as: :order_new
    post ':id/order', to: 'orders#sent'
  end

  # admins
  get '/admin', to: 'admins#index', as: :admin_index

  #artists
  resources :artists, only: [:new, :create]

  #labels
  resources :labels, only: [:new, :create]

  # orders
  get '/orders/:id/confirm', to: 'orders#show', as: :orders_confirmation

  # order/
  namespace :order, path: '/' do
    # subscriptions
    get '/artist/subscriptions', to: 'subscriptions#new', as: :subscription_new
    post '/artist/subscriptions', to: 'subscriptions#add'
  end

  # search
  get 'search', to: 'search#index', as: :search_index

   # community/
  namespace :community do
    # comments
    post ':id', to: 'comments#add'
    delete ':id', to: 'comments#delete'
    # questions
    get ':id/question', to: 'questions#index', as: :question_index
    delete ':id/question', to: 'questions#delete'
    get ':id/question/new', to: 'questions#new', as: :question_new
    post ':id/question/new', to: 'questions#add'
    # answers
    post ':id/question/:question_id', to: 'answers#add', as: :question
    delete ':id/question/:question_id', to: 'answers#delete'
    # requests
    #resources :requests, only: [:new, :create]
  end

  # communities
  get 'community/:id', to: 'communities#show', as: :communities_show
  get 'community/:id/question/:question_id', to: 'communities#qa_show', as: :community_qa_show
  delete 'search/:id', to: 'communities#delete', as: :delete_community
  #resources :communities, only: [:new, :create]
  get 'community/request/new', to: 'communities#new', as: :new_community
  post 'communiy/requests', to: 'communities#create', as: :communities

  # cart_items
  post 'items/:id', to: 'items#cart_create', as: :cart_items

  # items
  resources :items, only: [:show]
  post '/items/:id', to: 'items#update'
  get '/admin/item/new', to: 'items#new', as: :admin_new_item
  post '/admin/item/new', to: 'items#create', as: :admin_create_item
  get '/admin/item/:id/edit', to: 'items#edit', as: :admin_edit_item
  patch '/admin/item/:id/edit', to: 'items#update', as: :admin_update_item

  # users
  resources :users, only: [:show, :edit, :update]
  get 'ranking', to: 'users#ranking_show', as: :users_ranking
  get 'users/:id/my_community', to: 'users#my_community_index', as: :users_my_community
  get '/users/cancel/show', to: 'users#cancel_show', as: :users_cancel_show
  patch '/users/cancel/show', to: 'users#cancel_update'

  # user/
  namespace :user do
    # credits
    resources :credits, only: [:new, :create]
    # histories
    get 'history/:order_id/:id', to: 'histories#show', as: :history
    get 'history/:id', to: 'histories#index', as: :histories
    get 'history', to: 'histories#all', as: :histories_all
  end

  # home
  root to: 'home#index'

end
