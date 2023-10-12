Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true, except: [:test]
  end
end
