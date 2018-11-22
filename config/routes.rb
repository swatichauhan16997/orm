Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/index'
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/my_account'
  get 'add_food_to_fav',                to: 'food_items#add_food_to_fav'
  get 'add_restaurant_to_fav',          to: 'restaurants#add_restaurant_to_fav'
  get 'food_by_category',               to: 'restaurants#food_by_category'
  get 'category_list',                  to: 'food_items#category_list'
  get 'main_category_list',             to: 'food_items#main_category_list'
  get 'addresses_list',                 to: 'home_deliveries#addresses_list'
  post 'create_address',                 to: 'home_deliveries#create_address'
  get 'users/edit'
  get 'offers/change_foodlist'
  get 'addresses/view_address'
  get 'offers/change_category'
  get 'restaurants/new_release' => 'restaurants#new_release', as: :new_release
  get 'orders/session-orders' => 'orders#list_session_orders', as: :list_session_orders
  get 'users/new_address' => 'users#add_address', as: :add_address
  get 'home_deliveries/new_address' => 'home_deliveries#add_address', as: :new_address
  get 'offers/change_category'
  get 'offers/view_all_offers'

  get 'food_categories/change_category'
  get '/change_city' => "addresses#change_city"
  get 'restaurants/area_wise_restaurants' =>
      "restaurants#area_wise_restaurants", as: :area
  get :search, controller: :restaurants
  get :location, controller: :restaurants

  get :search_in_admin, controller: :static_pages

  get 'terms', to: 'static_pages#terms'
  get 'stripe_accounts/full', to: 'stripe_accounts#full'
  resources :stripe_accounts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :home_deliveries
  namespace :charts do
    get 'super_admin_new_users'
    get 'super_admin_food_items'
    get 'super_admin_orders'
    get 'super_admin_revenue'
    get 'admin_orders'
    get 'admin_revenue'
  end

  resources :bank_accounts
  resources :home_deliveries do
    member do
      get :change_home_delivery_status
    end
  end
  resources :home_deliveries_delivery_boys do
    collection do
      get :get_home_delivery
    end
  end

  resources :home_deliveries_delivery_boys


  resources :charges do
    collection do
      get :get_account
    end
  end
  resources :orders do
    collection do
      get :show_cart
    end
      delete :remove
  end
  resources :home_deliveries
  resources :contacts
  resources :addresses
  resources :favourites
  resources :commission_settings
  resources :master_orders do
    collection do
      get :bill_details
    end
    collection do
      get :my_orders
    end
    member do
      get :change_pickup_order_status
    end
  end
  resources :offers
  resources :food_items
  resources :categories
  resources :restaurants do
    resources :images, :only => [:create, :destroy]
    collection do
      get :restaurant_list
    end
    member do
      get :change_restaurant_status
      get :show_rest
    end
  end
  resources :food_categories
  resources :reviews do
    member do
      get :review_edit
      patch :review_update
      delete :review_delete
    end
  end
  resources :restaurantscategories
  resources :users, path: 'customers' do
    collection do
      get :role_assign
      get :change_password_edit
      patch :change_password_update
    end
    member do
      get :change_user_status
      get :profile
      patch :updateprofile
      get :edituser
      patch :assign_role
    end
  end

  resources :delivery_boys, path: 'deliveryboys' do
    collection do
      get :change_password_edit
      patch :change_password_update
    end
    member do
      get :profile
      get :editprofile
      patch :updateprofile
      get :change_delivery_boy_status
    end
  end
  devise_for :users, controllers:
              {
                sessions: 'users/sessions',
                registrations: 'users/registrations',
                omniauth_callbacks: 'users/omniauth_callbacks'
              }
  devise_for :delivery_boys, controllers:
              {
                sessions: 'delivery_boys/sessions',
                registrations: 'delivery_boys/registrations'
              }
  # post "add_review", to: 'restaurants#add_review'
end
