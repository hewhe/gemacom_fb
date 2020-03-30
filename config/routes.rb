Rails.application.routes.draw do
  root "homes#top"
  get "/about" => "homes#about"

  get "/login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :users, only: [:new, :create, :show, :edit, :update]

  resources :invites, only: [:index, :new, :create, :edit, :update, :destroy]
  # get "/invites/serch" => "invites#search", as: "invite_search"

  resources :groups, only: [:index, :new, :create, :show, :edit, :update] do
    collection do
      get :top
    end
    member do
      get :info
    end
    resources :joins, only: [:create, :destroy]
    resources :boards, only: [:new, :create, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create, :destroy]
      resources :bookmarks, only: [:create, :destroy]
    end
  end
  get "/groups/top" => "groups#top"
  get "/groups/:id/info" => "groups#info"

  resources :tasks, only: [:index, :new, :create, :update, :estroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end