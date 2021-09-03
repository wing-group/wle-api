module V1
  class RegistrationController < ApplicationController
    def create
      if session[:user_id]
        user = UserFactory.create! params['user']

        if user
          session[:user_id] = user.id
          render json: {
            status: :created,
            user: user
          }
        else
          render json: ErrorResponses.internal
        end
      else
        render json: ErrorResponses.forbidden
      end
    end
  end
end