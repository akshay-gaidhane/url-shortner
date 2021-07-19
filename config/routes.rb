Rails.application.routes.draw do
  resources :urls, only: [:index, :new, :create, :show] do
    collection do
      get "/stats" => "urls#stats"
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "urls#index"
end
