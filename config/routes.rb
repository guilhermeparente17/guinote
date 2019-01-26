Rails.application.routes.draw do
  devise_for :users
  root to: "welcome#index"

  get "sobremim", to: "welcome#sobremim"

  resources :docs

  authenticated :user do 
  	root "docs#index", as: "authenticated_root"
  end	
end
