class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.json { render json: {id: @user.id, success: true}}
        # render json: { user: @user, status: :created}
        # format.json { user: @user, status: :created}
        # format.html { redirect_to user_path(@user), notice: 'User was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @user = User.new
  end

  def update
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.permit(:email, :password, :audio)
    end
end
