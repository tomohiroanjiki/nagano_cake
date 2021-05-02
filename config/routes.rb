Rails.application.routes.draw do

  namespace :hogehoge do
    get 'test_admin/new'
  end
  namespace :hoge do
    get 'test_admin/new'
  end
  devise_for :customers, skip: :all
  devise_scope :customer do
    get "/customers/sign_up" => "public/devise/registrations#new"
    post "/customers" => "public/devise/registrations#create"
    # get "/customers/sign_in" => "public/devise/sessions#new",as: "new_session"
    get "/customers/sign_in" => "public/devise/sessions#new"
    post "/customers/sign_in" => "public/devise/sessions#create"
    delete "/customers/sign_out" => "public/devise/sessions#destroy"
  end

  scope module: :public do
    get "top" => "homes#top",as: "top"
    # scope module: :devise do
    #   devise_for :customers
    # end
    get '/' => 'homes#top'
    get 'about' => 'homes#about'
    resources :items, only:[:index, :show]
    patch 'withdrawal_update' => 'customers#withdraw'
    get "customers" => "customers#my_page",as: "my_page"
    resources :customers, only:[:edit, :update]
    get 'withdrawal' => 'customers#unsubscribe'
    delete 'cart_items' => 'cart_items#destroy_all'
    resources :cart_items, only:[:index, :destroy, :update, :create, :destroy_all]
    resources :orders, only:[:new, :edit, :index, :show, :create]
    post 'oders_confirm' => 'orders#confirm'
    get 'oders_complete' => 'orders#complete'
    resources :deliverys, only:[:index, :edit, :create, :update, :destroy]

  end

  devise_for :admins
  devise_scope :admin do
    get 'admin/sign_in'=> "devise/sessions#new"
  end

  namespace :admin do
    get '/' => "homes#top"
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    get 'orders/:id' => "orders#show",as: 'orders'
    patch 'orders/update'
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
