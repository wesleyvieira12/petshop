Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'dogs#index', as: :authenticated_root
    end
  	unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resources :dogs

  get "/dogs/new_update/:id", to:"dogs#new_update", as: "new_update"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
