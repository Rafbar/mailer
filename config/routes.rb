Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :transactions, only: [:index, :create, :show, :update, :destroy] do
        resources :bank_guarantees, only: [:create, :show, :update, :destroy]
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
