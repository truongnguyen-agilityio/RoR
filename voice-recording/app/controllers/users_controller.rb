class UsersController < ApplicationController
  before_filter :set_user, only: [:show, :edit, :update]
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)

    # respond_to do |format|
    if @user.save
      render json: {id: @user.id, success: true}
    else
      render json: {id: @user.id, success: false}
    end
    # end
  end

  def new
    @user = User.new
  end

  # GET /user/1/edit
  def edit
  end

  def update
    @user.assign_attributes(user_params)
    if @user.save
      render json: {id: @user.id, success: true}
    else
      render json: {id: @user.id, success: false}
    end
  end

  def show
  end

  private
    def user_params
      params.permit(:email, :password, :audio)
    end
    def set_user
      @user = User.find(params[:id])
    end
end
