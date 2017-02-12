Rails.application.routes.draw do
  root 'root#index'

  get  :incoming, to: 'incoming#index'
  post :incoming, to: 'incoming#create'

  scope :api do
    post :login,     to: 'sessions#login',     defaults: { format: 'json' }
    post :authorize, to: 'sessions#authorize', defaults: { format: 'json' }

    scope :abuse do
      post :bounce, to: 'abuse#bounce'
    end

    resources :identities, defaults: { format: 'json' }
  end
end
