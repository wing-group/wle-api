Rails.application.routes.draw do
  namespace :api do

    namespace :v1 do
      post :register, to: "registration#create"
      post :login, to: "session#create"
      delete :logout, to: "session#logout"
      get :current_user, to: "session#current_user"

      root to: "static#home"
    end

  end
end
