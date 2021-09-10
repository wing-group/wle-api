module Api::V1
  class SessionController < ApplicationController
    include Api::V1::Concerns::CurrentUserConcern

    def create
      response = nil
      user = User
        .find_by(email: params["user"]["email"])
        .try(:authenticate, params["user"]["password"])

      if user
        session[:user_id] = user.id
        response = Response.new(
          201,
          body: {
            logged_in: true,
            user: user
          }
        ).to_json
      end

      render response || ErrorResponses.unauthorized
    end

    def current_user
      if @current_user
        render Response.new(
          200,
          body: {
            logged_in: true,
            user: @current_user
          }
        ).to_json
      else
        render Response.new(204).to_json
      end
    end

    def logout
      reset_session
      render Response.new(
        200,
        body: {
          logged_in: false
        }
      ).to_json
    end
  end
end
