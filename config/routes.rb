Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/all_products" => "products#all"
  get "/keyboards" => "products#keys"
  get "/desks" => "products#desk"
  get "/chairs" => "products#chair"
end
