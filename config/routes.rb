Rails.application.routes.draw do

  root to: 'tests#index'

  get :sign_up, to: 'users#new'

  resources :users, only: %i[new create]

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end
end
