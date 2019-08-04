Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
  resources :users, only: [:show, :update, :destroy, :index] do
    collection do
      post :sign_up
      post :sign_out
    end
  end

end
