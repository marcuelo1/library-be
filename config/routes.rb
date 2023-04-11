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
        post :rejected
      end
    end
  end
end
