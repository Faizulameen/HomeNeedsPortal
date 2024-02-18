Rails.application.routes.draw do
  resources :categories
  resources :workers do
    resources :blocks
    resources :reviews
  end
  get 'viewer', to: "workers#viewer"
  get 'viewwer', to: "workers#viewwer"
  get 'search', to: "workers#search"

  devise_for :users
  get 'cards/show'
  resources :products do
    resources :payments
    resources :order_items
    resources :order
    resources :reviewws
   
  end
  resources :likes, only: [:create, :destroy]
  get 'view', to: "products#view"
  get 'vieww', to: "products#vieww"
  get 'searc', to: "products#searc"
  get 'contact', to: "products#contact"
   get 'alluser', to: "products#alluser"

  resources :shops, only:[:index, :show]
  resources :order_items
  resource :cards
  resources :bookings, only:[:index, :show]



  root 'shops#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end







 # scope '/checkout' do
  #   post 'create', to: 'checkout#create', as: 'checkout_create'
  #   get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  #   get 'success', to: 'checkout#success', as: 'checkout_success'
  # end
