Rails.application.routes.draw do
  resources :credits, only: [:index, :new, :show, :create, :destroy]
  resources :transactions, only: [:create, :new, :show, :destroy]

  root to: 'credits#index'
end
