Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/detail", to: "static_pages#detail"
    get "/mens", to: "static_pages#mens"
    get "/womens", to: "static_pages#womens"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    namespace :admin do
      resources :static_pages
      resources :categories
      root "static_pages#index"
    end
    resources :users
    resources :categories, only: :show
    resources :products do
      collection do
        get :result
      end
    end
  end
end
