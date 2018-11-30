Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#top"

  get "topics/index" => "topics#index"
  get "topics/show/:id" => "topics#show"
  post "topics/create" => "topics#create"
  post "topics/delete/:id" => "topics#delete"

  post "posts/create" => "posts#create"
  post "posts/delete/:id" => "posts#delete"

  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/:id" => "users#show"
  post "users/delete_post/:id" => "users#delete_post"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "login" => "users#login_form"

end
