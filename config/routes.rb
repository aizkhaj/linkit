Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end
  # We pass resources :posts to the resources :topics block. This nests the post routes under the topic routes.

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
