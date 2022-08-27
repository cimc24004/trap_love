Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts, only: [:index, :create] do
  end
  get "/posts/:random_id" => "posts#show", as: "post"
  delete "/posts/:random_id" => "posts#destroy"
  put "/posts/:random_id" => "posts#show"
  # resources :answers
  get "/posts/:post_random_id/answers/:id" => "post_answers#show", as: "post_answer"
  get "/posts/:post_random_id/answers" => "post_answers#index", as: "post_answers"
    post "/posts/:post_random_id/answers/" => "post_answers#create"

  root "posts#index"
end
