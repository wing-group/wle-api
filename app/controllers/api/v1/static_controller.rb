module Api::V1
  class StaticController < ApplicationController
    def home
      render json: { status: "WLE API is up and running" }
    end
  end
end
