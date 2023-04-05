Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :user_system do
    resources :books, only: [:index, :show, :create, :destroy]
    resources :magazines, only: [:index, :show, :create, :destroy]
    resources :e_books, only: [:index, :show, :create, :destroy]
    resources :theses, only: [:index, :show, :create, :destroy]
    resources :newspapers, only: [:index, :show, :create, :destroy]
  end
end
