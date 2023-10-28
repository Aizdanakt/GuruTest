# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: :gurus,
                     path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: 'users/sessions'}

  root 'user/tests#index'

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end

  namespace :user do
    resources :user_passed_tests, only: %i[show update] do
      get :result, on: :member
      post :gist, on: :member
    end

    resources :tests, only: :index do
      post :start, on: :member
    end
  end
end
