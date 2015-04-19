class Api::V1::UsersController < ApplicationController
	before_filter :restrict_access
	before_filter :find_user, only: [:show, :update, :destroy]

  def index
  	# render json: User.all
  	render json: User.all, status: 200
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  	def find_user
  		@user = User.find(params['id'])
  	end
end

