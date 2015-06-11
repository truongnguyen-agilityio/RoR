class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  private
  	def authenticate_by_auth_token
  		unless authenticate_by_header || authenticate_by_params
  			render json: {message: "Invalid auth_token"}, status: 401
  		end
      @current_user = User.find_by_auth_token(@auth_token)
  	end
  	def authenticate_by_header
  		return true if @auth_token
  		authenticate_with_http_token do |token|
  			@auth_token = token
  		end
  	end
  	def authenticate_by_params
  		return true if @auth_token
  		@auth_token = params[:auth_token]
  	end
end
