Rails.application.routes.draw do
  root to: redirect('/products')
  resources :categories
  resources :products
end
