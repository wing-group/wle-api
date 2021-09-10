module Api::V1
  class RegistrationController < ApplicationController
    def create
      if session[:user_id]
        user = UserFactory.create! params['user']

        if user
          session[:user_id] = user.id
          render json: Response.new(
            201,
            message: "Registered",
            body: {
              logged_in: true,
              user: user
            }
          ).as_json
        else
          render json: ErrorResponses.internal
        end
      else
        render json: ErrorResponses.forbidden
      end
    end
  end
end
