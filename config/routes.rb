Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end
  resources :user_passed_tests, only: %i[show update] do
    member do
      get :result
    end
  end

  root 'tests#index'
end
