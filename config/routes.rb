Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'api/v1/sessions',
    registrations: 'api/v1/registrations'
  }
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :livros, only: [ :index, :show, :create ]
    end
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
