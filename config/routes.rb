Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
  end
  resources :user_passed_tests, only: %i[show update] do
    get :result, on: :member
  end

  root 'tests#index'
end
