Rails.application.routes.draw do

  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sing_in: :login, sing_out: :logout }

  resources :feedbacks, only: %i[new create]
  resources :badges, path: :awards, only: %i[index show]

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  namespace :admin do
    resources :tests do
      member do
        patch :update_inline
      end
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :badges, path: :awards
    resources :gists, only: :index
  end
end
