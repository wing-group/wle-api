module Api::V1
  class RegistrationController < ApplicationController
    def create
      if !session[:user_id]
        user = UserFactory.create! params['user']

        if user
          session[:user_id] = user.id
          render Response.new(
            201,
            body: {
              logged_in: true,
              user: user
            }
          ).to_json
        else
          render ErrorResponses.internal
        end
      else
        render ErrorResponses.forbidden
      end
    end
  end
end
