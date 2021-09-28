Rails.application.routes.draw do
  devise_for :users
  resources :jobs
  post '/checkout', to: "checkouts#gateway"
  get '/checkout/paid', to: "checkouts#paid"
  get '/checkout/failed', to: "checkouts#failed"
  root to: "pages#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
