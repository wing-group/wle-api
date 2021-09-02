Rails.application.routes.draw do

  namespace :v1 do
    post :register, to: "registrations#create"
    post :login, to: "sessions#create"
    delete :logout, to: "sessions#logout"
    get :logged_in, to: "sessions#logged_in"

    root to: "static#home"
  end

end
