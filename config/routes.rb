Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope 'api/v1' do
    devise_for :users, defaults: { format: :json }, controllers: {
      passwords: 'api/v1/users/passwords',
      registrations: 'api/v1/users/registrations',
      sessions: 'api/v1/users/sessions',
    }
  end

  namespace :api do
    namespace :v1 do

    end
  end
end
