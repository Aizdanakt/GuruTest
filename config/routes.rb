# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: :gurus,
                     path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: 'users/sessions'}

  root 'user/tests#index'

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :gists, only: :index
  end

  resources :user_passed_tests, only: %i[show update] do
    get :result, on: :member

    resources :gists, only: :create
  end

  namespace :user do
    resources :tests, only: :index do
      post :start, on: :member
    end
  end
end
