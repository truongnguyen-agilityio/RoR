class SessionsController < ApplicationController
  def new
  end

  def create
  	def create
		  session[:username] = params[:username]
		  render :text => "Welcome #{session[:username]}!"
		end
  end

  def destroy
  	session[:username] = nil
  end
end
