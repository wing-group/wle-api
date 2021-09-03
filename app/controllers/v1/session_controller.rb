module V1
  class SessionController < ApplicationController
    include V1::Concerns::CurrentUserConcern

    def create
      response = nil
      user = User
        .find_by(email: params["user"]["email"])
        .try(:authenticate, params["user"]["password"])

      if user
        session[:user_id] = user.id
        response = Response.new(
          201,
          message: "Logged in",
          body: {
            logged_in: true,
            user: user
          }
        ).as_json
      end

      render json: response || ErrorResponses.unauthorized
    end

    def logged_in
      if @current_user
        render json: Response.new(
          200,
          message: "Logged in",
          body: {
            logged_in: true,
            user: @current_user
          }
        ).as_json
      else
        render json: Response.new(
          200,
          message: "Not logged in",
          body: {
            logged_in: false
          }
        ).as_json
      end
    end

    def logout
      reset_session
      render json: Response.new(
        200,
        message: "Logged out"
      ).as_json
    end
  end
end
