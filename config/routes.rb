Rails.application.routes.draw do
  resources :credits, only: [:index, :new, :show, :create, :destroy]
  resources :transactions, only: [:create, :show, :destroy]

  root to: 'credits#index'
end
