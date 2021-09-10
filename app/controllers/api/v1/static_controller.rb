module Api::V1
  class StaticController < ApplicationController
    def home
      render Response.new(200, message: "WLE API is up and running!").to_json
    end
  end
end
