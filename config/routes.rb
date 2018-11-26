Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#top"

  get "topics/index" => "topics#index"
  get "topics/show/:id" => "topics#show"
  post "topics/create" => "topics#create"
  post "topics/delete/:id" => "topics#delete"

  post "posts/create" => "posts#create"
  post "posts/delete/:id" => "posts#delete"

end
