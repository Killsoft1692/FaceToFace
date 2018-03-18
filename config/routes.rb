Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :user_info
  end

  resources :profile do
    resources :skills
  end

  scope 'api' do
    scope 'v1' do
      resources :api_profile
    end
  end

  root 'place#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
