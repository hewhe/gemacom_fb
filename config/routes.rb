Rails.application.routes.draw do
  root "homes#top"
  get "/about" => "homes#about"

  get "/login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :users, only: [:new, :create, :show, :edit, :update]

  resources :invites, only: [:index, :new, :create, :edit, :update, :destroy]
  # get "/invites/serch" => "invites#search", as: "invite_search"

  resources :groups, only: [:new, :create, :show, :edit, :update] do
    collection do
      get :top
    end
    member do
      get :info
      get :member
    end
    resources :joins, only: [:create] do
      collection do
        delete :destroy
      end
    end
    resources :boards, only: [:new, :create, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create] do
        collection do
          delete :destroy
        end
      end
      resources :bookmarks, only: [:create] do
        collection do
          delete :destroy
        end
      end
    end
  end

  resources :tasks, only: [:index, :new, :create, :update, :estroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end