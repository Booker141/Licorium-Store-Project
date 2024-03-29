Rails.application.routes.draw do

  root :to => 'catalog#index'

  get 'about' => 'about#index'
  get 'checkout' => 'checkout#index'
  get 'admin/producer' => 'admin/producer#index'
  get 'admin/supplier' => 'admin/supplier#index'
  get 'admin/liquor' => 'admin/liquor#index'
  get 'admin/order' => 'admin/order#index'

  get 'about/index'

  get 'admin/producer/new'   
  post 'admin/producer/create'
  get 'admin/producer/edit'
  post 'admin/producer/update'
  post 'admin/producer/destroy'
  get 'admin/producer/show'
  get 'admin/producer/show/:id' => 'admin/producer#show'
  get 'admin/producer/index'

  get 'admin/supplier/new'   
  post 'admin/supplier/create'
  get 'admin/supplier/edit'
  post 'admin/supplier/update'
  post 'admin/supplier/destroy'
  get 'admin/supplier/show'
  get 'admin/supplier/show/:id' => 'admin/supplier#show'
  get 'admin/supplier/index'

  get 'admin/liquor/new'   
  post 'admin/liquor/create'
  get 'admin/liquor/edit'
  post 'admin/liquor/update'
  post 'admin/liquor/destroy'
  get 'admin/liquor/show'
  get 'admin/liquor/show/:id' => 'admin/liquor#show'
  get 'admin/liquor/index'

  get 'catalog/show'
  get 'catalog/show/:id' => 'catalog#show'
  get 'catalog/index'
  get 'catalog/latest'

  get 'cart/add'
  post 'cart/add'
  get 'cart/remove'
  post 'cart/remove'
  get 'cart/clear'
  post 'cart/clear'

  post 'admin/order/close'
  post 'admin/order/destroy'
  get 'admin/order/show'
  get 'admin/order/show/:id' => 'admin/order#show'
  get 'admin/order/index'

  get 'checkout/index'
  post 'checkout/submit_order'
  get 'checkout/thank_you'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
