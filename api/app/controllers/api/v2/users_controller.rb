class Api::V2::UsersController < ApplicationController
	before_filter :find_user, only: [:show, :update, :destroy]

  def index
  	render xml: User.all
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

