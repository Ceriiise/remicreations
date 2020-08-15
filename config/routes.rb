Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'contact', to: 'pages#contact'

  resources :categories
  resources :articles do
    member do
      patch "/downvote", to: 'articles#downvote'
      patch "/upvote", to: 'articles#upvote'
    end
  end
end
