class ChatsController < ApplicationController
  def room
  	if session[:username].present?
  		respond_to do |format|
  			format.html
  		end
  	else
	  	redirect_to login_path
	  end
  end

  def new_message
	  # Check if the message is private
	  if recipient = params[:message].match(/@(\w+) (.+)/)
	    # It is private, send it to the recipient's private channel
	    @channel = "/messages/private/#{recipient.captures.first}"
	    @message = { :username => session[:username], :msg => recipient.captures.second }
	  else
	    # It's public, so send it to the public channel
	    @channel = "/messages/public"
	    @message = { :username => session[:username], :msg => params[:message] }
	  end

	  respond_to do |f|
	    f.js
	  end
	end
end
