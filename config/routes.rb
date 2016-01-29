Rails.application.routes.draw do
  resources :credits, only: [:index, :new, :show, :create, :destroy] do
    resources :transactions, only: [:index, :new, :show, :create, :destroy]
  end
  root to: 'credits#index'
end
