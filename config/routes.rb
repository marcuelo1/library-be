Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin_system do
    resources :books, only: [:index, :show, :create, :destroy]
    resources :magazines, only: [:index, :show, :create, :destroy]
    resources :e_books, only: [:index, :show, :create, :destroy]
    resources :theses, only: [:index, :show, :create, :destroy]
    resources :newspapers, only: [:index, :show, :create, :destroy]
    resources :borrows, only: [:index, :show, :create] do
      collection do
        post :return
      end
    end
    resources :request_extensions, only: [:index, :show] do
      collection do
        post :approve
        post :reject
      end
    end
  end

  namespace :user_system do
    resources :books, only: [:index, :show]
    resources :magazines, only: [:index, :show]
    resources :e_books, only: [:index, :show]
    resources :theses, only: [:index, :show]
    resources :newspapers, only: [:index, :show]
    resources :request_extensions, only: [:show, :create]
  end
end
