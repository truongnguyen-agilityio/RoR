class Api::V1::ProjectsController < ApplicationController
  before_filter :authenticate

  def index
    render json: @user.projects, status: 200
  end

  def show
  end

  def update
  end

  def create
  end

  def destroy
  end

  protected
    def authenticate
      authenticate_or_request_with_http_token do |token|
        @user = User.find_by_auth_token(token)
      end
    end
end
