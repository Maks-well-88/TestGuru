Rails.application.routes.draw do

  resources :test_passages, only: %i[show update] do
    post :start, on: :member
  end

  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true, except: :index
    end
  end
end
