Rails.application.routes.draw do
  devise_for :users
  root "projects#index"
  resources :projects do
    put 'assign_user', on: :member
    resources :todos, except: [:show, :index] do
      member do
        patch :complete
      end
    end
  end
end