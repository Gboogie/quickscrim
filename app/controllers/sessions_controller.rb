class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      log_in user
      remember user
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      flash.now[:danger] = "Invalid email/password combination"
      redirect_to '/login'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
