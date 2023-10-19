Rails.application.routes.draw do
  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
  end
  resources :user_passed_tests, only: %i[show update] do
    get :result, on: :member
  end

  get :signup, to: 'users#new'

  resources :users, only: :create

  get :login, to: 'sessions#new'
  get :logout, to: 'sessions#destroy'

  resources :sessions, only: :create
end
