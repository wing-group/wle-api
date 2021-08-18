class StaticController < ApplicationController
  def home
    render json: { status: "Hello World!" }
  end
end