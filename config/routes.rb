Rails.application.routes.draw do

  namespace :v1 do
    post :register, to: "registration#create"
    post :login, to: "session#create"
    delete :logout, to: "session#logout"
    get :logged_in, to: "session#logged_in"

    root to: "static#home"
  end

end
