Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope 'api/v1' do
    devise_for :users, skip: :all, defaults: { format: :json }

    devise_scope :user do
      # registrations routes
      post :users, to: 'api/v1/users/registrations#create'
      patch :users, to: 'api/v1/users/registrations#update'
      delete :users, to: 'api/v1/users/registrations#destroy'

      scope :users do
        # sign_in / sign_out routes
        post :sign_in, to: 'api/v1/users/sessions#create'
        delete :sign_out, to: 'api/v1/users/sessions#destroy'

        # Password recoverable routes
        post :password, to: 'api/v1/users/passwords#create'
        patch :password, to: 'api/v1/users/passwords#update'
      end
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :test_apis
    end
  end
end
