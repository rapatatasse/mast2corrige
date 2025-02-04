Rails.application.routes.draw do
  resources :products
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :new]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get '/register' => 'users#new', as: :register
  post '/register' => 'users#create'
  post '/soldes' => 'products#soldes', as: :soldes
  post '/soldesselection' => 'products#soldesselection', as: :soldesselection


  root to: "pages#home"

end


