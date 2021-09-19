Rails.application.routes.draw do

  resources :test_passages, only: %i[show update] do
    post :start, on: :member
  end

  resources :tests do
    resources :questions, shallow: true
      resources :answers, shallow: true
  end
end
